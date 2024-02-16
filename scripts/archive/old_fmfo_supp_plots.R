
<!-- #MOVE THESE -->

  <!-- Supplementary plots -->

  <!-- ```{r} -->

  <!-- trimmings_fm <- -->
    <!--   fread(here("data/large_data/embodied_fishfromtrimmings_per_cell.csv")) |> -->
    <!--   as_tibble() |> -->
    <!--   ungroup() |> -->
    <!--   select(fao_area_code, LonCentre, LatCentre, fm_embodied_fish) |> group_by(LonCentre, LatCentre) |> -->
    <!--   summarise(fm_embodied_fish = sum(fm_embodied_fish, na.rm=TRUE)) -->


    <!-- ggplot()+ -->
    <!--   geom_tile(data = trimmings_fm_mass |> filter(fm_embodied_fish_mass>0), aes(x=LonCentre, y=LatCentre, fill=fm_embodied_fish_mass+1))+ -->
    <!--   geom_sf(data = rnaturalearth::ne_countries(scale = "medium", returnclass = "sf"), fill="grey90", colour="grey90")+ -->
    <!--   scale_fill_gradientn(colours = brewer.pal(n=8, "YlOrRd"), -->
                                  <!--                        trans = "log10")+ -->
    <!--   theme(panel.background = element_rect(fill="transparent"))+ -->
    <!--   labs(fill="Embodied fish (MT)", x="", y="", title = paste(paste("Fish meal -", 38400*0.4),  "MT demand, trimmings, fish-dominant")) -->

    <!-- ggsave(file = here("figures/presos/fishmeal_trimmings_mass.jpg"), height = 4, width=7) -->


    <!-- trimmings_fo_mass <- fread(here("data/large_data/embodied_fishfromtrimmings_per_cell.csv")) |> as_tibble() |>  ungroup() |> -->
      <!--   select(fao_area_code, LonCentre, LatCentre, fo_embodied_fish_mass) |> group_by(LonCentre, LatCentre) |> summarise(fo_embodied_fish_mass = sum(fo_embodied_fish_mass, na.rm=TRUE)) -->


      <!-- ggplot()+ -->
      <!--   geom_tile(data = trimmings_fo_mass |> filter(fo_embodied_fish_mass>0), aes(x=LonCentre, y=LatCentre, fill=fo_embodied_fish_mass+1))+ -->
      <!--   geom_sf(data = rnaturalearth::ne_countries(scale = "medium", returnclass = "sf"), fill="grey90", colour="grey90")+ -->
      <!--   scale_fill_gradientn(colours = brewer.pal(n=8, "YlOrRd"), -->
                                    <!--                        trans = "log10")+ -->
      <!--   theme(panel.background = element_rect(fill="transparent"))+ -->
      <!--   labs(fill="Embodied fish (MT)", x="", y="", title = paste(paste("Fish oil -", 27900*0.3),  "MT demand, trimmings, fish-dominant")) -->

      <!-- ggsave(file = here("figures/presos/fish oil_trimmings_mass.jpg"), height = 4, width=7) -->

      <!-- #forage fish -->

      <!-- forage_fm_mass <- fread(here("data/large_data/embodied_foragefish_per_cell.csv")) |> as_tibble() |>  ungroup() |> -->
        <!--   select(fao_area_code, LonCentre, LatCentre, fm_embodied_fish_mass) |> group_by(LonCentre, LatCentre) |> summarise(fm_embodied_fish_mass = sum(fm_embodied_fish_mass, na.rm=TRUE)) -->


        <!-- ggplot()+ -->
        <!--   geom_tile(data = forage_fm_mass |> filter(fm_embodied_fish_mass>0), aes(x=LonCentre, y=LatCentre, fill=fm_embodied_fish_mass+1))+ -->
        <!--   geom_sf(data = rnaturalearth::ne_countries(scale = "medium", returnclass = "sf"), fill="grey90", colour="grey90")+ -->
        <!--   scale_fill_gradientn(colours = brewer.pal(n=8, "YlOrRd"), -->
                                      <!--                        trans = "log10")+ -->
        <!--   theme(panel.background = element_rect(fill="transparent"))+ -->
        <!--   labs(fill="Embodied fish (MT)", x="", y="", title = paste(paste("Fishmeal -", 38400*0.6),  "MT demand, forage fish, fish-dominant")) -->

        <!-- ggsave(file = here("figures/presos/fishmeal_forage_mass.jpg"), height = 4, width=7) -->


        <!-- forage_fo_mass <- fread(here("data/large_data/embodied_foragefish_per_cell.csv")) |> as_tibble() |>  ungroup() |> -->
          <!--   select(fao_area_code, LonCentre, LatCentre, fo_embodied_fish_mass) |> group_by(LonCentre, LatCentre) |> summarise(fo_embodied_fish_mass = sum(fo_embodied_fish_mass, na.rm=TRUE)) -->


          <!-- ggplot()+ -->
          <!--   geom_tile(data = forage_fo_mass |> filter(fo_embodied_fish_mass>0), aes(x=LonCentre, y=LatCentre, fill=fo_embodied_fish_mass+1))+ -->
          <!--   geom_sf(data = rnaturalearth::ne_countries(scale = "medium", returnclass = "sf"), fill="grey90", colour="grey90")+ -->
          <!--   scale_fill_gradientn(colours = brewer.pal(n=8, "YlOrRd"), -->

                                        <!--                        trans = "log10" -->
                                        <!--                        )+ -->
          <!--   theme(panel.background = element_rect(fill="transparent"))+ -->
          <!--   labs(fill="Embodied fish (MT)", x="", y="", title = paste(paste("Fish oil -", 27900*0.7),  "MT demand, forage fish, fish-dominant")) -->

          <!-- ggsave(file = here("figures/presos/fish oil_forage_mass.jpg"), height = 4, width=7) -->

          <!-- forage_fo_mass$fo_embodied_fish_mass |> max() -->
          <!-- trimmings_fm_mass |> filter(fm_embodied_fish_mass>0) |> pull(fm_embodied_fish_mass) |> min() -->

          <!-- ``` -->

