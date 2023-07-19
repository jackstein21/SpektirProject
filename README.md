# SpektirProject
A compilation of my work from my internship with Nuromedia during summer 2023. I was assigned to create an object detection model to create and learn from simulated gas leak data.

## Blender
This part and other rendering is adoped from Max Wild, a previous intern for Nuromedia - https://github.com/max-wild/Thermal-Gas-Rendering

The blender folder containes the DocekrFile and nessicary setup and python files to create render images of what a gas leak would look like on a thermal imaging camera. The following variables needs to be adjusted in the file render_gas.py:
- total_renders = This is where you set the number of renders to be made. It should be in multiples of 4
- out_dir = This is the output directiory. I suggest it stays as "renders" 
- blend_dir = This is the directory of where blender gets installed from the Dockerfile

This file will also output a .csv with the emmision coordinates for each rendered image that can be used for annotating the .xml files to come.

## Creating the xml annotation
Using the Annotating_Gas_Leaks.ipynb file it is very easy to create xml annotated images to be used to train the object detection model. The folder 'backgrounds' contains thermal images to be used as backgrounds to be superimposed with the gas leaks created above. By downloading the backgrounds and following the steps in the .ipynb file, gas leaks can be rendered and annotated all in the same place. There are a few variables that need to be adjused as noted in the .ipynb file too.

If one chooses to make the renders using the dockerfile in the above section, the renders need to be uploaded and the path to the renders just needs to be changed.
