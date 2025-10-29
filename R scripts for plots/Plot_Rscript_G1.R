# Load the ggplot2 package
library(ggplot2)

# Define the values of beta and corresponding power for alpha_1 = 1
beta_values <- c(0, 0.1, 0.2, 0.3, 0.35, 0.4, 0.45, 0.5, 0.55, 0.6)
power_values_alpha1_1 <- c(0.054, 0.382, 0.892, 0.948, 0.962, 0.972, 0.976, 0.98, 0.98, 0.982)

# Define the values of power for alpha_1 = 0.51
power_values_alpha1_051 <- c(0.054, 0.278, 0.756, 0.878, 0.902, 0.92, 0.922, 0.924, 0.928, 0.932)

# Define the values of power for alpha_i = 0.1
power_values_alpha1_01 <- c(0.044, 0.234, 0.664, 0.82, 0.85, 0.864, 0.868, 0.88, 0.886, 0.892)

# Create a data frame for plotting
data <- data.frame(beta = beta_values, 
                   power_alpha1_1 = power_values_alpha1_1, 
                   power_alpha1_051 = power_values_alpha1_051,
                   power_alpha1_01 = power_values_alpha1_01)

# Plot the power curves
p <- ggplot(data) +
  geom_line(aes(x = beta, y = power_alpha1_1, color = "alpha1_1"), size = 1) +  # Line for alpha_1 = 1
  geom_point(aes(x = beta, y = power_alpha1_1), color = "red", size = 2) +     # Red points for alpha_1 = 1
  geom_line(aes(x = beta, y = power_alpha1_051, color = "alpha1_051"), size = 1) + # Line for alpha_1 = 0.51
  geom_point(aes(x = beta, y = power_alpha1_051), color = "red", size = 2) +   # Red points for alpha_1 = 0.51
  geom_line(aes(x = beta, y = power_alpha1_01, color = "alpha1_01"), size = 1) +  # Line for alpha_1 = 0.1
  geom_point(aes(x = beta, y = power_alpha1_01), color = "red", size = 2) +    # Red points for alpha_1 = 0.1
  scale_x_continuous(breaks = beta_values) +                                    # Force all beta coefficients on the x-axis
  ggtitle(expression("Power Evolution for Different " * alpha[i] * " Values, " * mu[0] * " = 0.4")) +  # Add a title with Greek letters
  xlab(expression(" " * beta * " Values")) +                                    # Label the x-axis
  ylab(expression("Power  " * g[1*","*f])) +                                    # Label the y-axis
  theme_minimal(base_size = 15) +                                               # Apply a minimal theme with larger base text size
  scale_color_manual(name = expression(alpha[i]),                               # Create a legend with Greek letters
                     labels = c(expression(alpha[i] == 0.1), 
                                expression(alpha[i] == 0.51), 
                                expression(alpha[i] == 1.00)),                  # Main legend for alpha values
                     values = c("alpha1_1" = "blue", "alpha1_051" = "green", "alpha1_01" = "orange")) +  # Define colors for the lines
  theme(legend.position = "right",                                              # Place legend on the right
        plot.title = element_text(hjust = 0.5),                                 # Center align the title
        legend.text.align = 0,                                                  # Left-align legend text
        legend.title.align = 0.5) +                                             # Center-align legend title
  guides(color = guide_legend(override.aes = list(size = 5)))                   # Increase the size of legend points

# Manually adding size text to the bottom right corner
p + annotate("text", x = 0.6, y = 0.05, label = "size = 0.044", color = "orange", hjust = 1, size = 5) +  # for alpha = 0.1
  annotate("text", x = 0.6, y = 0.1, label = "size = 0.054", color = "green", hjust = 1, size = 5) +  # for alpha = 0.51
  annotate("text", x = 0.6, y = 0.15, label = "size = 0.054", color = "blue", hjust = 1, size = 5)      # for alpha = 1.00
