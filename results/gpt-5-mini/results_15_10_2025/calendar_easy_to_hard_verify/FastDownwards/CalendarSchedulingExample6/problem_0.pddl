(define (problem meeting-monday)
  (:domain meeting-scheduling)

  (:objects
    thomas dylan jerry - person
    ; 30-minute slot start times between 09:00 and 16:30
    s0900 s0930 s1000 s1030 s1100 s1130 s1200 s1230 s1300 s1330 s1400 s1430 s1500 s1530 s1600 s1630 - slot
  )

  (:init
    ; ----------------------
    ; Participant free slots
    ; ----------------------
    ; Thomas: free entire workday 09:00-17:00 -> all 30-min slots available
    (free thomas s0900) (free thomas s0930) (free thomas s1000) (free thomas s1030)
    (free thomas s1100) (free thomas s1130) (free thomas s1200) (free thomas s1230)
    (free thomas s1300) (free thomas s1330) (free thomas s1400) (free thomas s1430)
    (free thomas s1500) (free thomas s1530) (free thomas s1600) (free thomas s1630)

    ; Dylan: busy 10:30-11:00 (s1030) and 13:30-14:00 (s1330). All other slots free.
    (free dylan s0900) (free dylan s0930) (free dylan s1000)
    ; s1030 blocked -> not included
    (free dylan s1100) (free dylan s1130) (free dylan s1200) (free dylan s1230)
    (free dylan s1300)
    ; s1330 blocked -> not included
    (free dylan s1400) (free dylan s1430) (free dylan s1500) (free dylan s1530) (free dylan s1600) (free dylan s1630)

    ; Jerry: busy 09:00-11:00 (blocks s0900,s0930,s1000,s1030),
    ;       busy 11:30-14:30 (blocks s1130,s1200,s1230,s1300,s1330,s1400),
    ;       busy 16:00-17:00 (blocks s1600,s1630).
    ; Remaining free slots are s1100, s1430, s1500, s1530
    (free jerry s1100) (free jerry s1430) (free jerry s1500) (free jerry s1530)

    ; ------------------------------------------
    ; Precomputed slot-allowed start facts:
    ; A start sX is slot-allowed iff for every participant both sX and the next 30-min slot are free.
    ; We only include slot-allowed for starts that satisfy everyone's availability.
    ; From the participants' constraints above, the only feasible 60-min start slots are:
    ;   s1430 (14:30-15:30) and s1500 (15:00-16:00).
    ; (All earlier candidate starts are impossible because Jerry is busy.)
    ; ------------------------------------------
    (slot-allowed s1430)
    (slot-allowed s1500)
  )

  (:goal (and (scheduled)))
)