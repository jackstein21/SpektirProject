# SummerProject
A compilation of my work from my internship with Nuromedia during the summer of 2023. I was assigned to create an object detection model to create and learn from simulated gas leak data.

## Blender
This part and other rendering is adopted from Max Wild, a previous intern for Nuromedia - https://github.com/max-wild/Thermal-Gas-Rendering

The blender folder contains the DocekrFile and the necessary setup and Python files to create render images of what a gas leak would look like on a thermal imaging camera. The following variables need to be adjusted in the file render_gas.py:
- total_renders = This is where you set the number of renders to be made. It should be in multiples of 4
- out_dir = This is the output directory. I suggest it stays as "renders"
- blend_dir = This is the directory where blender gets installed from the Dockerfile

This file will also output a .csv with the emission coordinates for each rendered image that can be used for annotating the .xml files to come.

## Creating the XML annotation
Using the Annotating_Gas_Leaks.ipynb file it is very easy to create XML annotated images to be used to train the object detection model. This file was created and tested using Colab. The file is designed to download all necessary files from this GitHub repository. Variables within it can be changed to modify the number of gas leak renders to be made and the number of final images (with annotations) to be made. It stores all created images locally in Colab which can be downloaded and used for model training later on.

If one chooses to make the renders using the docker file in the above section, the renders need to be uploaded and the path to the renders just needs to be changed.

## Object Detection
Within the object_detection folder are all the required documents to train a TensorFlow object detection model. To set up the computer Docker should be installed and the terminal must be set to the object_detection directory. From there the image can be created. After running the image using an example command found in notes.txt, the user can link their local folder to one within the container. Using the prompt to run the shell script the machine will move all necessary files into the correct location and follow the TensorFlow object detection API instructions to train a custom model and export it.
The folder currently contains a small dataset of cars that were used for testing. By running the above XML annotation script, the files can easily be moved to replace the train and test data in this folder. Other important files that need to be updated are the annotations/lable_map.pbtxt, and the models/pipeline.config to reflect the goal of the object detection.

The final part of the detection where the model gets exported still faces some errors, though.


This entire project was an increbile learning exerience and this reposity is a collection of all the work I had put into it over the summer internship. I am thankful for this opportunity to learn and and help out my company.
