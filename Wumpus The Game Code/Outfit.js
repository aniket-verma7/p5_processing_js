class Outfit
{
    outfit1(shiftX)
    {
        push();
        fill("#F7F7F7");
        noStroke();
        rect(284-shiftX, 161, 332, 50)
        fill("white");
        triangle(317-shiftX, 161, 450-shiftX, -80, 583-shiftX, 161);
        pop();
    }

    outfit2(shiftX)
    {
        fill("#1A1A1A");
        rect(284-shiftX, 161, 332, 50);
        fill("black");
        rect(316-shiftX, -31, 269, 192);
    }

    outfit3(shiftX)
    {
        fill("#1A1A1A");
        rect(387-shiftX, 156, 127, 20, 9);
        fill("black");
        arc(450-shiftX, 157, 100, 100, radians(180), radians(0));
        quad(476-shiftX, 345, 425-shiftX, 345, 437-shiftX, 320, 466-shiftX, 320);
    }

    outfit4(shiftX)
    {
        push();
        noStroke();
        fill("white");
        triangle(390-shiftX, 166, 450-shiftX, 0, 510-shiftX, 166);
        pop();
    }
}