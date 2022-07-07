import SwiftUI

private struct Distances {
    static let hidden: CGFloat = 500
    static let maxUp: CGFloat = -100
    static let dismiss: CGFloat = 200
}

struct BottomSheet<Content: View>: View {
    @Binding var isPresented: Bool
    @ViewBuilder let content: Content
    @State private var translation = Distances.hidden
    var body: some View {
        ZStack {
            Color.gray
                .opacity(0.5)

            VStack {
                Spacer()
                contentView
                    .offset(y: translation)
                    .animation(.interactiveSpring(), value: isPresented)
                    .animation(.interactiveSpring(), value: translation)
                    .gesture(
                        DragGesture()
                            .onChanged { value in
                                guard translation > Distances.maxUp else { return }
                                translation = value.translation.height
                            }
                            .onEnded { value in
                                if value.translation.height > Distances.dismiss {
                                    translation = Distances.hidden
                                    isPresented = false
                                } else {
                                    translation = 0
                                }
                            }
                    )
            }
            .background(
                VStack {
                    Spacer()
                        .frame(height: abs(Distances.maxUp) * 2)
                }
            )
        }
        .ignoresSafeArea()
        .onAppear {
            withAnimation {
                translation = 0
            }
        }

    }

    private var contentView: some View {
        VStack(spacing: 0) {
            handle
                .padding(.top, 6)
            content
                .padding(20)
                .padding(.bottom, 30)
        }
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(24)
        .shadow(color: Color.white, radius: 2)
    }

    private var handle: some View {
        RoundedRectangle(cornerRadius: 3)
            .fill(Color.gray)
            .frame(width: 48, height: 5)
    }
}
