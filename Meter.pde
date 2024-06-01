class Meter {
    float val;
    float maxVal;
    float xCoord;
    float yCoord;
    float xHeight;
    int colorCode;
    
    Meter(float initVal, float maxVal, float xCoord, float yCoord, float xHeight, int colorCode) {
        this.val = initVal;
        this.maxVal = maxVal;
        this.xCoord = xCoord;
        this.yCoord = yCoord;
        this.xHeight = xHeight;
        this.colorCode = colorCode;
    }
    
    void change(float diff) {
        this.val += diff;
        if (this.val > this.maxVal) {
            this.val = this.maxVal;     
        } else if (this.val <=  0) {
            this.val = 0;
            dead = true;
        }
    }
    float returnVal() {
        return this.val;
    }
    
    void display() {
        fill(colorCode);
        rect(this.xCoord, this.yCoord, this.val * 2, this.xHeight);
    }
    
}
