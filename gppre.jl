"""
Calculates GP prediction using squared exponential covariance kernal 
with Automatic Relevance Determination (ARD).
    
# Inputs:
    N     number of training points
    D     number of design variables
    X     training points (N x D)
    xs    test point (D x 1)
    P     vector of length scales for covariance kernel (D x 1)
    sf    signal variance
    a     coefficients for GP computed offline

# Outputs:
    fs    prediction output of test point

"""

function gppre(X, a, xs, N, D, P, sf)

      #Calculate kstar by looping over X and xs
      for i = 1:N
            temp = 0.0
            for k = 1:D
                  temp = temp + 1 / P[k] * (X(i, k) - xs[k])^2
            end
            kstar[i] = sf^2 * exp(-0.5 * temp)
      end

      # Do kstar'*a to get fs
      fs = 0
      for i = 1:N
            fs = fs + kstar[i] * a[i]
      end

      return fs
end
