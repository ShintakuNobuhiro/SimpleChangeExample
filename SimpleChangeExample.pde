/*
  このプログラムは、簡易的にお金の出し方を計算するもの。
 増やすを押すと1段階づつ、より大きな額で支払う場合の計算ができる。
 */
int price = 1543;//支払うべき額
int pt = price;
int value[] = {10000, 5000, 1000, 500, 100, 50, 10, 5, 1};
int num[] = new int[value.length];
boolean breaked = false;

void setup() {
  size(480, 500);
  if (price < 0) {
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
  if(!breaked) {
    noFill();
    rect(0, 0, 300, 100);
    fill(0);
    text("増やす", 100, 50);
  }
  for (int i=0; i<value.length; i++) {
    sum += value[i]*num[i];
    text(value[i]+"円,"+num[i], 0, 100+20*(i+1));
    if (i != value.length-1 && num[i] != 0) {
      noFill();
      rect(100, 100+20*i, 100, 20);
      text("崩す", 140, 115+20*i);
    }
  }

  text("支払額:"+sum+"円", width-100, 50);
  int change = sum-price;
  text("おつり:"+change+"円", width-100, 100);
}

void mouseReleased() {
  if (!breaked && mouseX>=0 && mouseX<=300 && mouseY>=0 && mouseY <=100) {
    for (int i=num.length-1; i>0; i--) {
      if (num[i]!= 0) {
        num[i]=0;
        num[i-1]++;
        break;
      }
    }
  }
  for (int i=0; i<value.length-1; i++) {
    if(num[i] != 0 && mouseX >= 100 && mouseX <= 200 && mouseY >= 100+20*i && mouseY <= 120+20*i) {
      breaked = true;
      num[i]--;
      if(i%2==0)
        num[i+1]+=2;
      else
        num[i+1]+=5;
    }
  }
}