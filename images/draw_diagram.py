import matplotlib.pyplot as plt
from matplotlib.patches import Polygon, Rectangle, FancyArrowPatch, Circle
from math import atan2,degrees
fig, ax=plt.subplots(figsize=(12,7),dpi=180)
fig.patch.set_facecolor('#fcfaf5')
ax.set_facecolor('#fcfaf5')
steel='#283B4C'; orange='#CC8E2B'; teal='#1F7891'; grid='#9DA7AC'
# Ground line
ax.plot([-14,255],[0,0],color=steel,linewidth=2)
ax.text(246,-10,'desktop',ha='right',fontsize=10,color=steel)
# Side frame outline structural beams
ax.plot([6,238],[16,16],lw=17,color=steel,solid_capstyle='round')
ax.plot([102,166],[39,225],lw=21,color=steel,solid_capstyle='round')
ax.plot([166,215],[225,27],lw=20,color=steel,solid_capstyle='round')
ax.plot([102,213],[40,26],lw=15,color=steel,solid_capstyle='round')
# upper brace bar physical concept
ax.add_patch(Rectangle((149,177),23,14,facecolor=orange,edgecolor='#81551f',linewidth=1))
# tray top full length
ax.add_patch(Rectangle((6,30),120,9,facecolor=orange,edgecolor='#81551f',linewidth=1.5))
ax.add_patch(Rectangle((6,30),10,35,facecolor=orange,edgecolor='#81551f',linewidth=1.5))
ax.plot([23,123],[43,43],color=orange,lw=3)
# Cross brace
ax.add_patch(Rectangle((80,10),21,14,facecolor=orange,edgecolor='#81551f',linewidth=1))
ax.add_patch(Rectangle((203,10),22,14,facecolor=orange,edgecolor='#81551f',linewidth=1))
# Book representative translucent thin book slab from back support toward left
ax.add_patch(Polygon([(54,43),(99,43),(163,226),(118,226)],closed=True,facecolor='#B5C5D1',edgecolor='#60778B',linewidth=2,alpha=.60))
# Interior book paper lines
for i in range(3):
    ax.plot([55+i*4,120+i*4],[48,225],color='#95AAB9',lw=1,alpha=.7)
# Gravity arrow
ax.annotate('8 lb textbook\n~35.6 N downward',xy=(118,155),xytext=(14,186),
            fontsize=12,color=steel,weight='bold',
            arrowprops=dict(arrowstyle='-|>',color='#B44741',lw=2))
# Angle arc and helper reference
ax.plot([99,150],[43,43],ls='--',color=grid,lw=1.2)
ax.annotate('Rear support',xy=(201,109),xytext=(241,251),
            fontsize=11,color=steel,ha='right',
            arrowprops=dict(arrowstyle='->',color=steel,lw=1.5))
ax.annotate('Continuous shelf\nand front lip',xy=(19,56),xytext=(-5,118),
            fontsize=11,color=steel,
            arrowprops=dict(arrowstyle='->',color=steel,lw=1.5))
# Horizontal footprint measure
ax.annotate('',xy=(6,-16),xytext=(238,-16),arrowprops=dict(arrowstyle='<->',color=steel,lw=1))
ax.text(122,-22,'~238 mm deep',ha='center',va='top',fontsize=11,color=steel)
# vertical height measurement
ax.annotate('',xy=(249,0),xytext=(249,237),arrowprops=dict(arrowstyle='<->',color=steel,lw=1))
ax.text(254,124,'~237 mm tall',rotation=90,ha='left',va='center',fontsize=11,color=steel)
ax.set_xlim(-26,292);ax.set_ylim(-40,275);ax.set_aspect('equal');ax.axis('off')
fig.text(.045,.95,'SIDE VIEW  /  CONCEPTUAL LOAD PATH',fontsize=20,weight='bold',color=steel)
fig.text(.045,.905,'Prototype geometry  •  ~71° viewing angle  •  8 lb capacity not yet tested',fontsize=10.5,color='#526574')
fig.tight_layout(rect=(0,0,1,.9))
fig.savefig('/mnt/data/TextbookStand-GitHub/images/engineering_diagram.png',bbox_inches='tight',facecolor=fig.get_facecolor())
