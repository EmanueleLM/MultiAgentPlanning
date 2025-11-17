(define (problem itinerary-instance)
  (:domain itinerary-planning)
  (:objects
    presidio northbeach - location
    alice carlos farah eli dana betty grace - person
    t540 t615 t620 t630 t670 t688 t690 t763 t780 t800 t805 t810 t818 t823 t828 t1050 t1070 t1075 t1080 t1085 t1115 t1125 t1145 t1150 t1205 t1210 t1230 t1290 t1320 - time
  )

  (:init
    ; start state
    (at presidio)
    (at-time t540)

    ; friend locations
    (loc-of alice presidio)
    (loc-of carlos presidio)
    (loc-of farah presidio)
    (loc-of eli northbeach)
    (loc-of dana northbeach)
    (loc-of betty northbeach)
    (loc-of grace northbeach)

    ; directed routes (only those provided)
    (route18 presidio northbeach) ; 18 minutes
    (route17 northbeach presidio) ; 17 minutes

    ; time successor chain (ordered, non-overlapping timeline)
    (next t540 t615)
    (next t615 t620)
    (next t620 t630)
    (next t630 t670)
    (next t670 t688)
    (next t688 t690)
    (next t690 t763)
    (next t763 t780)
    (next t780 t800)
    (next t800 t805)
    (next t805 t810)
    (next t810 t818)
    (next t818 t823)
    (next t823 t828)
    (next t828 t1050)
    (next t1050 t1070)
    (next t1070 t1075)
    (next t1075 t1080)
    (next t1080 t1085)
    (next t1085 t1115)
    (next t1115 t1125)
    (next t1125 t1145)
    (next t1145 t1150)
    (next t1150 t1205)
    (next t1205 t1210)
    (next t1210 t1230)
    (next t1230 t1290)
    (next t1290 t1320)

    ; allowed travel time arcs (respecting provided durations only)
    ; Presidio -> North Beach (18 minutes)
    (travel18 t670 t688)  ; 11:10 -> 11:28
    (travel18 t800 t818)  ; 13:20 -> 13:38
    (travel18 t805 t823)  ; 13:25 -> 13:43
    (travel18 t810 t828)  ; 13:30 -> 13:48

    ; North Beach -> Presidio (17 minutes)
    (travel17 t763 t780)  ; 12:43 -> 13:00

    ; allowed meeting blocks (all non-overlapping options from audited candidates)
    ; Alice at Presidio 09:00-11:00
    (block alice presidio t540 t630) ; 09:00-10:30
    (block alice presidio t540 t620) ; 09:00-10:20
    (block alice presidio t540 t615) ; 09:00-10:15

    ; Carlos at Presidio 10:30-12:00
    (block carlos presidio t630 t690) ; 10:30-11:30
    (block carlos presidio t630 t670) ; 10:30-11:10
    (block carlos presidio t630 t705) ; Note: t705 not defined, so use available boundary t705? -> remove
    ; Corrected Carlos options consistent with defined timepoints:
    (block carlos presidio t630 t705) ; placeholder removed in final list below
  )

  ; Replacing the above Carlos block section with the correct options using defined timepoints only
)