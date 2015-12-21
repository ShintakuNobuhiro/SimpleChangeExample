/*
  このプログラムは、簡易的にお金の出し方を計算するもの。
 増やすを押すと1段階づつ、より大きな額で支払う場合の計算ができる。
 */
int price = 1543;//支払うべき額
int pt = price;
int value[] = {10000, 5000, 1000, 500, 100, 50, 10, 5, 1};
int num[] = new int[value.length];

void setup() {
  size(480, 350);
  if(price < 0){
    println("金額は0または自然数である必要があります。");
    exit();
  }
  for (int i=0; i<num.length; i++) {
    num[i] = pt/value[i];
    pt -= value[i]*num[i];
  }
}

void draw() {
  int sum=0;
  background(255);
  fill(255);
  rect(0, 0, 300, 100);
  fill(0);
  text("増やす", 100, 50);
  for (int i=0; i<num.length; i++) {
    sum += value[i]*num[i];
    text(value[i]+"円,"+num[i], 0, 100+20*(i+1));
  }
  text("支払額:"+sum+"円", width-100, 50);
  int change = sum-price;
  println(sum+","+price);
  text("おつり:"+change+"円", width-100, 100);
}

void mouseReleased() {
  if (mouseX>=0 && mouseX<=300 && mouseY>=0 && mouseY <=100) {
    for (int i=num.length-1; i>0; i--) {
      if (num[i]!= 0) {
        num[i]=0;
        num[i-1]++;
        break;
      }
    }
  }
}