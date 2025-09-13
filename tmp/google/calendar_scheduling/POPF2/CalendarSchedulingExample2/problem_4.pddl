(define (problem schedule-meeting)
  (:domain meeting-scheduling)
  
  (:objects
    roy kathryn amy - person
    ts9_30-10 ts10_30-11 ts11-11_30 ts11_30-12 ts12-12_30 ts13-13_30 ts13_30-14 ts14-14_30 ts15-15_30 ts15_30-16 ts16-16_30 ts9_00-9_30 ts10-10_30 ts12_30-13 ts9_30-10_00 ts16_30-17_00 ts9_00-14_30 ts15_00-16_00 ts10_00-10_30 ts14_30-15_00 ts16_30-17 - time_slot
  )
  
  (:init
    ; Roy's constraints
    (conflict roy ts9_00-9_30)
    (conflict roy ts10-10_30)
    (conflict roy ts11-11_30)
    (conflict roy ts12_30-13)
    (free roy ts9_30-10)
    (free roy ts10_30-11)
    (free roy ts11_30-12)
    (free roy ts12-12_30)
    (free roy ts13-13_30)
    (free roy ts13_30-14)
    (free roy ts14-14_30)
    (free roy ts14_30-15_00)
    (free roy ts15-15_30)
    (free roy ts15_30-16)
    (free roy ts16-16_30)
    ; Kathryn's constraints
    (conflict kathryn ts9_30-10_00)
    (conflict kathryn ts16_30-17_00)
    (free kathryn ts9_00-9_30)
    (free kathryn ts10_00-10_30)
    ; Amy's constraints
    (conflict amy ts9_00-14_30)
    (conflict amy ts15_00-16_00)
    (conflict amy ts16_30-17_00)
    (free amy ts14_30-15_00)
    (preferred amy ts14_30-15_00)
    ; General
    (not (scheduled ts9_30-10))
    (not (scheduled ts16_30-17))
  )
  
  (:goal
    (exists (?ts - time_slot) 
      (and 
        (scheduled ?ts)
        (scheduled-with-preference amy)
      )
    )
  )
)