# ---------------------------------------------------------------------------
# Two class example

# `truth` is a 2 level factor. The first level is `"Class1"`, which is the
# "event of interest" by default in yardstick. See the Relevant Level
# section above.
data(two_class_example)

# Binary metrics using class probabilities take a factor `truth` column,
# and a single class probability column containing the probabilities of
# the event of interest. Here, since `"Class1"` is the first level of
# `"truth"`, it is the event of interest and we pass in probabilities for it.
roc_curve(two_class_example, truth, Class1)

# ---------------------------------------------------------------------------
# `autoplot()`

# Visualize the curve using ggplot2 manually
library(ggplot2)
library(dplyr)
roc_curve(two_class_example, truth, Class1) %>%
  ggplot(aes(x = 1 - specificity, y = sensitivity)) +
  geom_path() +
  geom_abline(lty = 3) +
  coord_equal() +
  theme_bw()


# Or use autoplot
autoplot(roc_curve(two_class_example, truth, Class1))


if (FALSE) {

  # Multiclass one-vs-all approach
  # One curve per level
  hpc_cv %>%
    filter(Resample == "Fold01") %>%
    roc_curve(obs, VF:L) %>%
    autoplot()

  # Same as above, but will all of the resamples
  hpc_cv %>%
    group_by(Resample) %>%
    roc_curve(obs, VF:L) %>%
    autoplot()
}

