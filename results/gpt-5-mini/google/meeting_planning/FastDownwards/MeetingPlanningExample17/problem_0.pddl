(define (problem alamo-schedule-A)
  (:domain alamo-scheduling)

  ; Objects
  (:objects
    traveler - agent

    ; friends: Friend1..Friend12 are Alamo-based; Matthew is at Sunset during his window
    friend1 friend2 friend3 friend4 friend5 friend6 friend7 friend8 friend9 friend10 friend11 friend12 matthew - friend

    alamo-square sunset-district - location

    ; Explicit timepoints used by Schedule A (minute-level time-points as needed by the schedule)
    t0900 t0915 t0920 t0935 t0940 t0955
    t1000 t1015 t1020 t1035 t1040 t1055
    t1100 t1115 t1120 t1135 t1140 t1155
    t1200 t1215 t1220 t1235 t1240 t1255
    t1314 t1330 t1345 t1402 - time
  )

  ; Initial state
  (:init
    ; traveler starts at Alamo Square at 09:00
    (at traveler alamo-square)
    (time-now t0900)

    ; Friend home locations (all Alamo except Matthew)
    (friend-loc friend1 alamo-square)
    (friend-loc friend2 alamo-square)
    (friend-loc friend3 alamo-square)
    (friend-loc friend4 alamo-square)
    (friend-loc friend5 alamo-square)
    (friend-loc friend6 alamo-square)
    (friend-loc friend7 alamo-square)
    (friend-loc friend8 alamo-square)
    (friend-loc friend9 alamo-square)
    (friend-loc friend10 alamo-square)
    (friend-loc friend11 alamo-square)
    (friend-loc friend12 alamo-square)
    (friend-loc matthew sunset-district)

    ; Meeting slots as per Schedule A (all hard constraints). Format: slot-meeting <friend> <start> <end>
    ; Friend1 09:00–09:15
    (slot-meeting friend1 t0900 t0915)
    ; buffer 09:15–09:20 (no meeting)
    ; Friend2 09:20–09:35
    (slot-meeting friend2 t0920 t0935)
    ; Friend3 09:40–09:55
    (slot-meeting friend3 t0940 t0955)
    ; Friend4 10:00–10:15
    (slot-meeting friend4 t1000 t1015)
    ; Friend5 10:20–10:35
    (slot-meeting friend5 t1020 t1035)
    ; Friend6 10:40–10:55
    (slot-meeting friend6 t1040 t1055)
    ; Friend7 11:00–11:15
    (slot-meeting friend7 t1100 t1115)
    ; Friend8 11:20–11:35
    (slot-meeting friend8 t1120 t1135)
    ; Friend9 11:40–11:55
    (slot-meeting friend9 t1140 t1155)
    ; Friend10 12:00–12:15
    (slot-meeting friend10 t1200 t1215)
    ; Friend11 12:20–12:35
    (slot-meeting friend11 t1220 t1235)
    ; Friend12 12:40–12:55
    (slot-meeting friend12 t1240 t1255)

    ; Travel slot to reach Matthew at 13:30: depart Alamo 13:14 -> +16 min -> arrive Sunset 13:30
    ; Represented here as depart= t1314, arrive= t1330
    (travel-slot alamo-square sunset-district t1314 t1330)

    ; Matthew meeting slot (Schedule A minimum meeting): 13:30–13:45
    ; Use t1330 (13:30) as start and t1345 (13:45) as end
    ; We need t1345 as an object; it was included in objects as t1345
    (slot-meeting matthew t1330 t1345)

    ; Travel slot returning to Alamo: depart Sunset 13:45 -> +17 min -> arrive Alamo 14:02
    (travel-slot sunset-district alamo-square t1345 t1402)

    ; Successor (chronological) links among the explicit timepoints (documented ordering).
    ; This enforces the chronology of declared timepoints (useful for external reasoning / human inspection).
    (succ t0900 t0915)
    (succ t0915 t0920)
    (succ t0920 t0935)
    (succ t0935 t0940)
    (succ t0940 t0955)
    (succ t0955 t1000)
    (succ t1000 t1015)
    (succ t1015 t1020)
    (succ t1020 t1035)
    (succ t1035 t1040)
    (succ t1040 t1055)
    (succ t1055 t1100)
    (succ t1100 t1115)
    (succ t1115 t1120)
    (succ t1120 t1135)
    (succ t1135 t1140)
    (succ t1140 t1155)
    (succ t1155 t1200)
    (succ t1200 t1215)
    (succ t1215 t1220)
    (succ t1220 t1235)
    (succ t1235 t1240)
    (succ t1240 t1255)
    (succ t1255 t1314)
    (succ t1314 t1330)
    (succ t1330 t1345)
    (succ t1345 t1402)
  )

  ; Goal: enforce the "maximize number of friends met" private goal as a strict constraint by requiring the maximum feasible set from the candidate schedules (Schedule A).
  ; This problem requires meeting Friend1..Friend12 and meeting Matthew, and finishing back at Alamo Square at time 14:02.
  (:goal (and
    (met friend1)
    (met friend2)
    (met friend3)
    (met friend4)
    (met friend5)
    (met friend6)
    (met friend7)
    (met friend8)
    (met friend9)
    (met friend10)
    (met friend11)
    (met friend12)
    (met matthew)
    (at traveler alamo-square)
    (time-now t1402)
  ))
)