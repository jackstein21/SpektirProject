# this python script will be used to run the render gas script inside of a docker container
import os
from math import ceil

# docker run -it --rm --volume=/Users/jackstein/Documents/Nuromedia/DockerTest/blend/myblender/:/workspace IMAGE_NAME bash


# command to render gas images
def run_render(blend_dir,out_dir,four_render):
    os.system(f"{blend_dir} setup/gas_scene.blend --background --python setup/render_images_with_coords.py -- -o {out_dir} -r {four_render}")

if __name__ == "__main__":
    total_renders = 4
    out_dir = "renders"
    blend_dir = "/usr/local/blender/myblender/blender/blender"
    four_render = ceil(total_renders / 4)  # How many times 4 gas images are generated
    
    run_render(blend_dir,out_dir,four_render)
