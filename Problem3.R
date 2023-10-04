# Problem 3

library(ggplot2)

# Histogram

ggplot(galaxies, aes(x=a_26)) +
  geom_histogram(binwidth = 4, fill="coral", color = "black") + 
  labs(x = "Galaxy size (kpc)", y = "Frequency",
       title = "Distribution of Galaxy Sizes") + 
  theme_minimal()

# Plot

ggplot(galaxies, aes(x=D, y=a_26)) +
  geom_point(color="lightgreen", size = 1) +
  labs(x = "Distance to Galaxy (Mpc)", y = "Galaxy Size (Kpc)") +
  theme_minimal()

# Plot scaled by log10 

ggplot(galaxies, aes(x = D, y = a_26)) +
  geom_point(color = "skyblue", size = 1) +
  labs(x = "Distance to Galaxy (Mpc)", y = "Galaxy Size (kpc)", 
       title = "Distance vs. Galaxy Size") +
  scale_y_log10() +
  theme_minimal()

