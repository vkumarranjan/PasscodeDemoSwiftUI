//
//  VKNumberPad.swift
//  BMBDemo
//
//  Created by Vinay Nation on 15/09/20.
//  Copyright © 2020 Ranjan, Vinay : UK. All rights reserved.
//

import SwiftUI


struct VKNumberPad: View {
   
    
    var body: some View {
       // VStack{
            ZStack {
                Image("SS")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                
                NumberPad()
                
            }
       // }
        
        .preferredColorScheme(.light)
        
    }
    
}

struct VKNumberPad_Previews: PreviewProvider {
    static var previews: some View {
        VKNumberPad()
    }
}

struct NumberPad: View {
    @State var code: [String] = []
    
    var body: some View {
        VStack{
            Spacer()
            Text("Enter your passcode").font(.title)
                .foregroundColor(.white)
            
            HStack(spacing: 20) {
                
                ForEach(code,id: \.self) { i in
                    Text(i).font(.title).fontWeight(.semibold)
                        .foregroundColor(.white)
                }
            }
            
            
            Spacer()
            ForEach(dataArray){ i in
                HStack(spacing: self.getSpacing()) {
                    ForEach(i.row) { j in
                        Button(action:{
                        }) {
                            if j.value == "delete.left.fill" {
                                Image(systemName: j.value).font(.body).padding(.vertical, 20)
                            } else {
                                Text(j.value).padding(.vertical, 20)
                                    .font(.system(size: 20))
                            }
                        }
                        .buttonStyle(GradientButtonStyle())
                        
                        .frame(width: 60, height: 60)
                        .foregroundColor(Color.white)
                        .background(Color(#colorLiteral(red: 0.6622027438, green: 0.8196231838, blue: 0.9764705896, alpha: 1)))
                        .cornerRadius(30)
                    }
                }
                .padding(.vertical, 20)
            }
        }
        .padding(.bottom, 20)
    }
    
    func getSpacing() -> CGFloat {
        (UIScreen.main.bounds.width / 3) - 38
    }
}



//struct VerificationField: View {
//
//    var body: some View {
//
//    }
//}


struct type: Identifiable {
    var id: Int
    var row: [row]
}

struct row: Identifiable {
    var id: Int
    var value: String
}

var dataArray = [
    
    type(id: 0, row: [row(id: 1, value: "1"), row(id: 2, value: "2"), row(id: 3, value: "3")]),
    type(id: 1, row: [row(id: 1, value: "4"), row(id: 2, value: "5"), row(id: 3, value: "6")]),
    type(id: 2, row: [row(id: 1, value: "7"), row(id: 2, value: "8"), row(id: 3, value: "9")]),
    type(id: 3, row: [row(id: 1, value: "0"), row(id: 2, value: "delete.left.fill")]),    
]


struct GradientButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(Color(#colorLiteral(red: 0.01258722134, green: 0.2325290442, blue: 0.3635525703, alpha: 1)))
            .scaleEffect(configuration.isPressed ? 2.0 : 1.0)
    }
}
