//
//  ContentView.swift
//  RandomHW
//
//  Created by User08 on 2020/12/2.
//

import SwiftUI

struct ContentView: View {
    @State private var description = ""
    @State private var chooseIndex = 0
    @State private var showPage = false
    let choose = ["今日運勢", "本週運勢", "本月運勢", "今年運勢"]
    let myData: [myData] = jsonTo()
    
    var body: some View {
        var num = Int.random(in: 0...99)
        ZStack{
            Image("bg")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
            VStack{
//                Spacer()
                Picker(selection: $chooseIndex, label: Text("想測")){
                    ForEach(choose.indices){(index) in
                        Text("\(choose[index])")
                            .font(.custom("", size: 15))
                            .foregroundColor(.white)
                    }
                }
                .frame(width: 150)
                .clipped()
                
                Button(action: {
                    num = Int.random(in: 0...99)
                    showPage = true
                }, label: {
                    GOView()
                })
                .sheet(isPresented: $showPage, content: {
                    myPageView(choose: choose[chooseIndex], data: myData[num])
                })
                
                Text("\n我的\(choose[chooseIndex])")
                    .font(.custom("KouzanBrushFont", size: 35))
                    .foregroundColor(.white)
                
//                Image("cute")
//                    .resizable()
//                    .scaledToFit()
//                    .offset(x: 45, y: 30)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func jsonTo() -> [myData] {
    let url = Bundle.main.url(forResource: "淺草籤", withExtension: "json")!
    let data = try! Data(contentsOf: url)
    let decoder = JSONDecoder()
    let myDatas = try? decoder.decode([myData].self, from: data)
    return myDatas!
}


struct GOView: View {
    var body: some View {
        ZStack{
            Text(" GO   ")
                .font(.custom("", size: 25))
                .bold()
                .padding()
                .background(Color(red: 215/255, green: 95/255, blue: 110/255))
                .cornerRadius(25)
                .foregroundColor(.white)
                .offset(x: -30)
            Text(" ")
                .font(.custom("", size: 25))
                .padding()
                .background(Color(red: 225/255, green: 175/255, blue: 175/255))
                .foregroundColor(.white)
                .offset(x: 20)
            Text("⇨ ")
                .bold()
                .font(.custom("", size: 25))
                .padding()
                .background(Color(red: 225/255, green: 175/255, blue: 175/255))
                .cornerRadius(25)
                .foregroundColor(.white)
                .offset(x: 35)
        }
    }
}
