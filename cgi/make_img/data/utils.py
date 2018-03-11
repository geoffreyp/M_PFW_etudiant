from PIL import Image

width=400
height=200
yellow=(255,255,0)
blue=(0,0,255)

def make_img(size, filename):
    img = Image.new("RGB", (width, height))

    for x in range(width):
        for y in range(height):
            even_x = int(x/size) % 2
            even_y = int(y/size) % 2
            if even_x == even_y:
                img.putpixel((x,y), blue)
            else:
                img.putpixel((x,y), yellow)

    img.save(filename)
