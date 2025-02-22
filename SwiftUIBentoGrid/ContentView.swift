//
//  ContentView.swift
//  SwiftUIGrid
//
//  Created by Kyle Lei on 2024/6/25.
//

import SwiftUI


struct ContentView: View {
    let gutter: CGFloat = 10
    let margin: CGFloat = 10
    @State private var cellSize: CGSize?

    var body: some View {
     
        VStack(alignment: .leading) {
            Grid(alignment: .center, horizontalSpacing: gutter, verticalSpacing: gutter) {
                //GridRow that contains Grid AL and Grid MR
                GridRow {
                    //Grid AL that contains GridRow AF and GridRow GL
                    Grid(alignment: .leading, horizontalSpacing: gutter, verticalSpacing: gutter) {
                        //GridRow AF that contains GridCard A and GridBF
                        GridRow {
                            GridCard("A")
                                .gridCellColumns(4)
                                .frame(height: gridCellRows(8))
                            GridBF()
                                .gridCellColumns(10)
                        }
                        //GridRow GL that contains GridCard G2L
                        GridRow {
                            GridCardGL()
                        }
                        .frame(height: gridCellRows(4))
                    }
                    .gridCellColumns(14)
                    
                    //Grid MR that contains GridCard M2R
                    Grid(alignment: .leading, horizontalSpacing: gutter, verticalSpacing: gutter) {
                        GridCardMR()
                    }
                    .frame(height: gridCellRows(12))
                    .gridCellColumns(6)
                }
            }
            .frame(height: gridCellRows(12))
            
            Text("Bento Grid UI by SwiftUI Grid")
                .font(.largeTitle)
                .fontWeight(.medium)
                .foregroundStyle(.secondary)
                .frame(maxHeight: .infinity, alignment: .center)
        }
        .padding(margin)
        .frame(maxHeight: .infinity)
        .background(Color(uiColor: .lightGray).opacity(0.3))
        .ignoresSafeArea(.all)
     
    }

    
    func GridBF() -> some View {
        Grid(alignment: .leading, horizontalSpacing: gutter, verticalSpacing: gutter) {
            //GridRow that contains GridCard B&C and GridCard D
            GridRow {
                VStack(spacing: gutter) {
                    GridCard("B")
                        .frame(height: cellSize?.height)
                    
                    GridCard("C")
                        .frame(height: cellSize?.height)
                }
                .gridCellColumns(6)
                
                GridCard("D")
                    .gridCellColumns(4)
                    .frame(height: gridCellRows(4))
            }
            //GridRow that contains GridCard E and GridCard F
            GridRow {
                GridCard("E")
                    .gridCellColumns(2)
                    .readSize { value in
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
                            //Use PreferenceKey to read the basic grid width
                            cellSize = CGSize(width: value.width, height: value.width)
                        }
                    }
                
                GridCard("F")
                    .gridCellColumns(8)
            }
            .frame(height: gridCellRows(4))
        }
    }
    
    @ViewBuilder
    func GridCardGL() -> some View {
        GridCard("G")
                .gridCellColumns(5)
            
            VStack(spacing: gutter) {
                GridCard("H")
                GridCard("I")
            }
            .gridCellColumns(3)
            
            VStack(spacing: gutter) {
                GridCard("J")
                GridCard("K")
            }
            .gridCellColumns(4)

            GridCard("L")
                .gridCellColumns(2)
      
    }
    
    @ViewBuilder
    func GridCardMR() -> some View {
        GridRow {
            GridCard("M")
                .gridCellColumns(2)
            GridCard("N")
                .gridCellColumns(4)
        }
        .frame(height: gridCellRows(3))
        
        GridRow {
            GridCard("O")
                .gridCellColumns(2)
            
            GridCard("P")
                .gridCellColumns(4)
        }
        .frame(height: gridCellRows(2))
        
        GridRow {
            GridCard("Q")
                .gridCellColumns(6)
        }
        .frame(height: gridCellRows(2))
        
        
        GridRow {
            GridCard("R")
                .gridCellUnsizedAxes([.vertical, .horizontal])
                .gridCellColumns(6)
        }
        .frame(height: gridCellRows(5))
    }
    
    
    func gridCellRows(_ count: Int) -> CGFloat {
        var grid = ((cellSize?.width ?? 0) - gutter) / 2
        grid = grid * Double(count) + gutter * abs(Double(count - 1))
        return grid
    }
}

#Preview {
    ContentView()
}
