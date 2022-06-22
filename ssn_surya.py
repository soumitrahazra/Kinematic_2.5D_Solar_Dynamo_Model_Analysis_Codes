import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from matplotlib import rc
import matplotlib.style
#plt.ion()
## Plotting canvas properties.
params = {'legend.fontsize': 12,
          'axes.labelsize': 12,
          'axes.titlesize': 12,
          'xtick.labelsize' :12,
          'ytick.labelsize': 12,
          'grid.color': 'k',
          'grid.linestyle': ':',
          'grid.linewidth': 0.5,
          'mathtext.fontset' : 'stix',
          'mathtext.rm'      : 'DejaVu serif',
          'font.family'      : 'DejaVu serif',
          'font.serif'       : "Times New Roman", # or "Times"          
         }
matplotlib.rcParams.update(params)


# ### Counting the number of eruptions at every instant of time and then applying low pass filter

sh= np.loadtxt('ber.dat')
t = sh[:,0]
t = t/0.315

timebin = []

for i in range(1,len(t)):    
    if t[i-1] != t[i]:        
        timebin.append(t[i-1])        
    
countbin =[]        
for i in range (0, len(timebin)):
    count = t[t==timebin[i]].shape[0]
    countbin.append(count)   
    
# Gleissberg 1-2-2-2-1 filter
length = len(countbin)
signal = countbin
output = np.zeros(length-4)
coef= np.array([1,2,2,2,1])
for i in range(length - 4):    
    output[i] = np.sum(signal[i:i+5] * coef /8)
smoothed = pd.Series(output)
smoothed = smoothed.rolling(40).mean()    

fig, ax = plt.subplots(figsize =(20, 5))#, dpi = 600)
ax.set_xlabel('Years', fontsize = 18)
ax.set_ylabel("Sunspot Number", fontsize = 18)
plt.title('Sunspot Number Time Series  ', fontsize = 20) 

plt.plot(timebin,signal, linewidth=0.09, label ="SURYA SSN series")
plt.plot(timebin[0:-4],output, linewidth=0.5, label ="Gleissberg filter")
plt.plot(timebin[0:-4],smoothed, linewidth=2, label ="Rolling mean (40)")
plt.legend(fontsize=15)
plt.savefig('SSN_plot_1.jpg',dpi=200,bbox_inches='tight',pad_inches=0.5)

# ## counting the number of eruptions within a time window of one year and then smoothing further

data = np.loadtxt('ber.dat')

def countInRange(arr, n, x, y):   
    count = 0; 
    for i in range(n):         
        if (arr[i] >= x and arr[i] <= y):
            count += 1
    return count

t = data[:,0]
t = t/0.315 
n = len(t) 
countbin = []
for i in range(0, 1500):
    countbin.append(countInRange(t, n, i, i+1))
    
    
smoothed = pd.Series(countbin)
smoothed = smoothed.rolling(11).mean()

fig,ax = plt.subplots(figsize = (15,4))#, dpi=600)
plt.title('Sunspot Time Series', fontsize = 20) 
ax.set_xlabel('Time (Years)', fontsize = 18)
ax.set_ylabel("Yearly averaged SSN", fontsize = 18)
plt.plot(countbin, linewidth = 0.2)
plt.plot(smoothed)
plt.savefig('SSN_plot_2.jpg')
