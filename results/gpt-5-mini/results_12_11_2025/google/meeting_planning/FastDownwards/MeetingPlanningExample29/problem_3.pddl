(define (problem meet-nancy-sf)
  (:domain meeting-planning-sf)

  (:objects
    sunset_district haight_ashbury - location

    ;; Only enumerate slices that participate in the plan:
    ;; s0 = 09:00 (initial)
    ;; s41 = 19:15 (departure), s42..s50 = 19:30..21:30 (nancy-available slice starts), s51 = 21:45 (meeting end), s52 = 22:00 (final)
    s0 s41 s42 s43 s44 s45 s46 s47 s48 s49 s50 s51 s52 - slice
  )

  (:init
    ;; Directed routes (15 minutes each way)
    (route sunset_district haight_ashbury)
    (route haight_ashbury sunset_district)

    ;; Succession chain covering the evening region where meeting and return occur.
    (succ s41 s42) (succ s42 s43) (succ s43 s44) (succ s44 s45) (succ s45 s46)
    (succ s46 s47) (succ s47 s48) (succ s48 s49) (succ s49 s50) (succ s50 s51) (succ s51 s52)

    ;; Allow a single long wait from the morning start directly to the evening departure
    ;; so we don't need to enumerate every intermediate slice between 09:00 and 19:15.
    (later s0 s41)

    ;; Nancy's confirmed availability window: 19:30..21:45 corresponds to slice starts s42..s50 inclusive
    (nancy-available s42) (nancy-available s43) (nancy-available s44) (nancy-available s45) (nancy-available s46)
    (nancy-available s47) (nancy-available s48) (nancy-available s49) (nancy-available s50)

    ;; Mark the Haight-Ashbury location so meeting actions can be parameterized
    (is-haight haight_ashbury)

    ;; Initial location at 09:00 (s0)
    (at sunset_district s0)
  )

  ;; Goals: meet Nancy for at least the required time and return to Sunset District at 22:00 (s52)
  (:goal (and
    (met-nancy)
    (at sunset_district s52)
  ))
)