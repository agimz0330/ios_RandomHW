//
//  myPageView.swift
//  RandomHW
//
//  Created by User08 on 2020/12/2.
//

import SwiftUI

struct myPageView: View {
    var choose: String
    var data: myData
    
    var body: some View {
        let bgColor: Color = Color(red: 58/255, green: 68/255, blue: 77/255)
        let fontColor: Color = Color(red: 154/255, green: 137/255, blue: 144/255)
        let imgNum = Int.random(in: 0...24)
        
        ZStack{
            bgColor
            VStack{
                VStack(alignment: .leading){
                    if data.result.hope != nil {
                        Text("願望：\(data.result.hope!)")
                            .modifier(textModifier(textSize: 14))
                    }
                    if data.result.sick != nil {
                        Text("疾病：\(data.result.sick!)")
                            .modifier(textModifier(textSize: 14))
                    }
                    if data.result.person != nil {
                        Text("盼望的人：\(data.result.person!)")
                            .modifier(textModifier(textSize: 14))
                    }
                    if data.result.lost != nil {
                        Text("遺失物：\(data.result.lost!)")
                            .modifier(textModifier(textSize: 14))
                    }
                    if data.result.newHome != nil {
                        Text("蓋新居：\(data.result.newHome!)")
                            .modifier(textModifier(textSize: 14))
                    }
                    if data.result.moveHome != nil {
                        Text("搬家：\(data.result.moveHome!)")
                            .modifier(textModifier(textSize: 14))
                    }
                    if data.result.marry != nil {
                        Text("嫁娶：\(data.result.marry!)")
                            .modifier(textModifier(textSize: 14))
                    }
                    if data.result.travel != nil {
                        Text("旅行：\(data.result.travel!)")
                            .modifier(textModifier(textSize: 14))
                    }
                    if data.result.romance != nil{
                        Text("交往：\(data.result.romance!)")
                            .modifier(textModifier(textSize: 14))
                    }
                }
                ZStack{
                    fontColor
                        .frame(width: 300, height: 160)
                    Image("IMG_\(imgNum)")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 240, height: 180)
                        .clipped()
                }
                VStack{
                    Text("\(choose)：")
                        .modifier(textModifier(textSize: 14))
                    Text("\(data.type)")
                        .font(.custom("KouzanBrushFont", size: 50))
                        .foregroundColor(fontColor)
                        .padding([.top, .bottom], 5)
                        .padding([.leading, .trailing], 10)
                        .background(Color(red: 210/255, green: 210/255, blue: 210/255))
                        .cornerRadius(30)
                        .padding(10)
                }
                Text("\(data.explain)")
                    .modifier(textModifier(textSize: 18))
                
                if data.note != nil{
                    Text("\(data.note!)")
                        .modifier(textModifier(textSize: 14))
                        .padding()
                }
                Spacer()
                Text("\(data.poem)")
                    .modifier(textModifier(textSize: 16))
                    .padding(20)
            }
            .padding()
        }
    }
}

struct myPageView_Previews: PreviewProvider {
    static var previews: some View {
        myPageView(choose: "今日運勢",
                   data: myData(type: "吉吉吉",
                                poem: "好詩好詩詩，好詩好詩詩，好詩好詩詩，好詩好詩詩。",
                                explain: "哈哈哈哈哈哈ㄏ哈哈哈哈哈哈ㄏ哈哈哈哈哈哈ㄏ哈哈哈哈哈哈ㄏ哈哈哈哈哈哈ㄏ哈哈哈哈哈哈ㄏ哈哈哈哈哈哈ㄏ哈哈哈哈哈哈ㄏ哈哈哈哈哈哈ㄏ",
                                result: Thing(hope: "OK", sick: "OK", person: "OK", lost: "OK", newHome: "OK", moveHome: "OK", marry: "OK", travel: "OK", romance: "OK"),
                                note: "我討厭你，你小心一點"))
    }
}

struct textModifier: ViewModifier {
    var textSize: CGFloat
    let fontColor: Color = Color(red: 154/255, green: 137/255, blue: 144/255)
    func body(content: Content) -> some View {
        content
            .font(.custom("", size: textSize))
            .foregroundColor(fontColor)
    }
}
