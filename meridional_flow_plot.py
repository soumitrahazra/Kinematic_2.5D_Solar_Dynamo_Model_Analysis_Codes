#Written by Chitradeep Saha
import numpy as np
import sys
import os
import matplotlib.pyplot as plt
from matplotlib import rc
import matplotlib.style
#plt.ion()
## Plotting canvas properties.
params = {'legend.fontsize': 12, 'axes.labelsize': 12, 'axes.titlesize': 12, 'xtick.labelsize' :12,
          'ytick.labelsize': 12, 'grid.color': 'k',    'grid.linestyle': ':','grid.linewidth': 0.5,
          'mathtext.fontset' : 'stix',                 'mathtext.rm'      : 'DejaVu serif',
          'font.family'      : 'DejaVu serif',         'font.serif'       : "Times New Roman", }
matplotlib.rcParams.update(params)

########################################### data for the sreamfunction contour plot ####################################
data = np.loadtxt(os.getcwd()+'/psi.dat')
dim = int(np.sqrt(len(data[:,0])))
T = data[:,0].reshape(dim,dim)                             # reshaping the raw data columns into a square 2D matrix
R = data[:,1].reshape(dim,dim)
B = data[:,2].reshape(dim,dim)

# Num. sol. of the initial value problem to determine particle position at certain time interval along a given contour 
v0 = -25.0                                                # peak flow speed
rm = 6.96                                                  
gamma = 0.95
m = 1.5
Gam = 3.47
rp = 0.61*rm
r0 = (rm-rp)/4.0
beta1 = 1.5
beta2 = 1.8
eps = 2.0000001
pi = np.pi
dt = 0.0001;                                               # integration time step 
rads = [0.84,0.894,0.937,0.981];                           # normalized radial positions of the initial points 
points = [12, 14, 18, 33];                                 # no of points required on each contour curve  
rpoint1 = [0.84*6.96,0.894*6.96,0.937*6.96,0.981*6.96];    # initial four radial points
thpoint1 = [pi/3.5, pi/3.5, pi/3.5, pi/3.5]                # angular position of the initial four points
rpoint = [];                                               # blank array to store new radial positions
thpoint = [];                                              # blank array to store new angular position
def vvr(r, theta):                                         # vr (r, theta) function
    VR = 0.95*v0/(rm/r-gamma)**m/(r**2*np.sin(theta))*(r-rp)*np.sin(pi*(r-rp)/(rm-rp))*\
                      np.exp(-((r-r0)/Gam)**2)*((1.0-np.exp(-beta1*theta**eps))*\
                      (-beta2*np.exp(beta2*(theta-pi/2.0))) + beta1*eps*theta**(eps-1.0)*\
                      np.exp(-beta1*theta**eps)*(1.0-np.exp(beta2*(theta-pi/2.0))))
    return VR
def vvth(r, theta):                                        # vtheta (r, theta) function
    VTH = -0.95*v0/(rm/r-gamma)**m/(r*np.sin(theta))*(1.0 - np.exp(-beta1*theta**eps))*\
                      (1.0 - np.exp(beta2*(theta-pi/2.0)))*np.exp(-((r-r0)/Gam)**2)*\
                      (np.sin(pi*(r-rp)/(rm-rp))*(1.0 - 2.0*(r-r0)/Gam**2*(r-rp)) + \
                      pi*(r-rp)/(rm-rp)*np.cos(pi*(r-rp)/(rm-rp)))
    return VTH
    
r, th = np.meshgrid(np.linspace(rp, rm, dim), np.linspace(0, pi, dim))
X = r*np.cos(th)                       
Y = r*np.sin(th)  

# Loop through contours:
for c in range (0, 4):
    # Starting location at t=0:
    rn = rads[c]*rm
    thetan = np.pi/3.5
    # Main loop:
    for p in range (0, points[c]):
        t = 0.0 
        while (t <= 1.0/3.48569):
            # Advance positions using 2nd order R-K method:
            kr1 = dt*vvr(rn,thetan)
            kt1 = dt*vvth(rn,thetan)/rn
            kr2 = dt*vvr(rn + 0.5*kr1,thetan + 0.5*kt1)
            kt2 = dt*vvth(rn + 0.5*kr1, thetan + 0.5*kt1)/(rn+0.5*kr1)
            rn = rn + kr2
            thetan = thetan + kt2
            t = t + dt
        rpoint.append(rn)
        thpoint.append(thetan)
        print(p)

############################################  plot generation  #########################################################
fig, ax = plt.subplots(figsize=(12, 12.1),dpi=600)
plt.plot(rp*np.cos(np.linspace(0,np.pi/2,dim)),rp*np.sin(np.linspace(0,np.pi/2,dim)),'k')  # inner radial boundary
plt.plot(6.96*np.cos(np.linspace(0,np.pi/2,dim)),6.96*np.sin(np.linspace(0,np.pi/2,dim)),'k')    # outer radial boundary
plt.contour(R*np.sin(T),R*np.cos(T),B,levels=[0.009, 0.035, 0.062, 0.09],\
                    colors=['gray', 'gray', 'gray', 'gray'],linestyles = 'dashed')               # plot contours
c = ax.scatter(rpoint1*np.sin(thpoint1),rpoint1*np.cos(thpoint1), marker=">",c = 'k',s = 10**2)  # initial points 
c = ax.scatter(rpoint*np.sin(thpoint), rpoint*np.cos(thpoint), c = 'k', s = 10**2)               # subsequent points
plt.title('Meridional circulation profile in SURYA', fontsize = 18, color='blue',fontweight='bold') 
plt.contourf(Y, X, np.sqrt(Y**2 + X**2),colors =('grey'), levels=[3.8, 4.94], alpha=0.2)         # shaded tachocline
plt.ylim(0,rm)
plt.savefig('meridional_particle_pos.jpg')
plt.close()
