import SwiftUI

struct ResetPasswordPageView: View {
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    // For toggling password visibility
    @State private var showingPassword: Bool = false
    
    // For toggling confirm password visibility
    @State private var showingConfirmPassword: Bool = false

    var body: some View {
        NavigationStack {
            // Main VStack for the whole page
            VStack(alignment: .leading, spacing: 0) {
                // Top Navigation Bar
                HStack {
                    NavigationLink(destination: LoginPageView())
                    {
                        Image(systemName: "arrow.backward")
                            .font(.title2)
                            .foregroundColor(.black)
                    }
                    Spacer() 
                }
                .padding(.horizontal)
                .padding(.top, 20)
                
                // Page Title
                Text("Reset password")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                    .padding(.top, 20)
                    .padding(.bottom, 30)

                // Password Input Field
                VStack(alignment: .leading, spacing: 10) {
                    Text("Password")
                        .fontWeight(.bold)
                        .font(.system(size: 22))
                        .foregroundColor(.black)

                    HStack {
                        if showingPassword {
                            TextField("", text: $password,
                                      prompt: Text("Minimum 8 characters") // Placeholder
                                                .foregroundColor(.gray.opacity(0.6))
                            )
                            .foregroundColor(.black)
                        } else {
                            SecureField("", text: $password,
                                        prompt: Text("Minimum 8 characters") // Placeholder
                                                  .foregroundColor(.gray.opacity(0.6))
                            )
                            .foregroundColor(.black)
                        }
                        Button(action: {
                            showingPassword.toggle()
                        }) {
                            Image(systemName: showingPassword ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay( // Border for the input field
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    )
                    .autocapitalization(.none) // Ensure no auto-capitalization
                }
                .padding(.horizontal) // Apply horizontal padding to this section

                // MARK: - Confirm Password Input Field
                VStack(alignment: .leading, spacing: 10) {
                    Text("Confirm Password")
                        .fontWeight(.bold)
                        .font(.system(size: 22))
                        .foregroundColor(.black)
                        .padding(.top, 20)

                    HStack {
                        if showingConfirmPassword {
                            TextField("", text: $confirmPassword,
                                      prompt: Text("Re-enter password") // Placeholder
                                                .foregroundColor(.gray.opacity(0.6))
                            )
                            .foregroundColor(.black)
                        } else {
                            SecureField("", text: $confirmPassword,
                                        prompt: Text("Re-enter password") // Placeholder
                                                  .foregroundColor(.gray.opacity(0.6))
                            )
                            .foregroundColor(.black)
                        }
                        Button(action: {
                            showingConfirmPassword.toggle()
                        }) {
                            Image(systemName: showingConfirmPassword ? "eye.slash.fill" : "eye.fill")
                                .foregroundColor(.gray)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(8)
                    .overlay( // Border for the input field
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color(.systemGray4), lineWidth: 1)
                    )
                    .autocapitalization(.none) // Ensure no auto-capitalization
                }
                .padding(.horizontal) // Apply horizontal padding to this section
                .padding(.bottom, 30) // Space before the requirements list

                // MARK: - Password Requirements
                VStack(alignment: .leading, spacing: 5) {
                    Text("Your password must contains atleast :") // Note: "contains" -> "contain" for grammar
                        .font(.body)
                        .foregroundColor(.gray)
                        .padding(.bottom, 5)

                    // Using a custom BulletPoint view for consistent styling
                    BulletPoint(text: "Total of 8 Characters")
                    BulletPoint(text: "One Lower case letter (a-z)")
                    BulletPoint(text: "One Upper case letter (A-Z)")
                    BulletPoint(text: "One Number (0-9)")
                    BulletPoint(text: "One Special character (e.g. !@#$%^&*)")
                }
                .padding(.horizontal)

                Spacer()

                // MARK: - Reset Button
                Button(action: {
                    
                    // Add your password reset logic here
                    // You'd typically validate passwords, check if they match,
                    // and then call an API to reset.
                }) {
                    Text("Reset")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
            .navigationBarHidden(true)
            .background(Color.white.edgesIgnoringSafeArea(.all))
        }
    }
}

// MARK: - Custom Bullet Point View
// This helper struct creates a single bullet point line
struct BulletPoint: View {
    let text: String

    var body: some View {
        HStack(alignment: .top, spacing: 8) {
            Circle()
                .frame(width: 5, height: 5)
                .foregroundColor(.black)
                .offset(y: 8)

            Text(text)
                .font(.body)
                .foregroundColor(.black)
        }
    }
}

#Preview{
    ResetPasswordPageView()
}
