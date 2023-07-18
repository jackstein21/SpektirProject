# SpektirProject
A compilation of my work from my internship with Nuromedia during summer 2023. I was assigned to create an object detection model to create and learn from simulated gas leak data.

## Blender
The blender folder containes the DocekrFile and nessicary setup and python files to create render images of what a gas leak would look like on a thermal imaging camera. The following variables needs to be adjusted in the file render_gas.py:
- total_renders = This is where you set the number of renders to be made. It should be in multiples of 4
- out_dir = This is the output directiory. I suggest it stays as "renders" 
- blend_dir = This is the directory of where blender gets installed from the Dockerfile

This file will also output a .csv with the emmision coordinates for each rendered image that can be used for annotating the .xml files to come.

## Creating the xml annotation
