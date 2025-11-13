(define (problem sf-itinerary-instance)
  (:domain sf-itinerary)
  (:objects
    presidio northbeach - location
    alice carlos farah eli dana betty grace - person
    t540 t630 t720 t780 t840 t1032 t1050 t1080 t1125 t1230 t1290 - time
  )

  (:init
    ; start at Presidio at 09:00 (t540)
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

    ; directed routes specified
    (route18 presidio northbeach) ; 18 minutes
    (route17 northbeach presidio) ; 17 minutes

    ; discrete time progression
    (next t540 t630)   ; 09:00 -> 10:30
    (next t630 t720)   ; 10:30 -> 12:00
    (next t720 t780)   ; 12:00 -> 13:00
    (next t780 t840)   ; 13:00 -> 14:00
    (next t840 t1032)  ; 14:00 -> 17:12
    (next t1032 t1050) ; 17:12 -> 17:30
    (next t1050 t1080) ; 17:30 -> 18:00
    (next t1080 t1125) ; 18:00 -> 18:45
    (next t1125 t1230) ; 18:45 -> 20:30
    (next t1230 t1290) ; 20:30 -> 21:30

    ; allowed travel-time pairs
    (travel18 t1032 t1050) ; Presidio -> North Beach (18 minutes)
    ; (travel17 ...) not needed by the chosen schedule but direction exists

    ; allowed meeting blocks within availability windows
    (block alice presidio t540 t630)       ; 09:00-10:30 (within 09:00-11:00)
    (block carlos presidio t630 t720)      ; 10:30-12:00 (within 10:30-12:00)
    (block farah presidio t780 t840)       ; 13:00-14:00 (within 13:00-14:00)
    (block eli northbeach t1050 t1080)     ; 17:30-18:00 (within 17:30-18:30)
    (block dana northbeach t1080 t1125)    ; 18:00-18:45 (within 18:00-19:30)
    (block betty northbeach t1125 t1230)   ; 18:45-20:30 (>=75 min, within 18:45-22:00)
    (block grace northbeach t1230 t1290)   ; 20:30-21:30 (within 20:30-21:30)
  )

  (:goal (and
    (met alice)
    (met carlos)
    (met farah)
    (met eli)
    (met dana)
    (met betty)
    (met grace)
  ))
)