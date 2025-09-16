(define (domain combined-visit-meeting-domain)
  (:requirements :typing :durative-actions :numeric-fluent)
  (:types loc person)
  (:constants haight sunset - loc
              you jessica - person)

  ; You (Agent A) location
  (:predicates
    (at-location ?l - loc)        ; you are at a location
    (at ?p - person ?l - loc)      ; a person is at a location (jessica)
    (met)                           ; meeting occurred
  )
  (:functions
    (clock)                         ; numeric clock (time in 15-min units, 9:00 = 0)
  )

  ; Travel actions for you (Agent A)
  (:durative-action travel-you-haight-to-sunset_A
    :duration (= ?d 1)
    :condition (and (at start (at-location haight)))
    :effect (and (at end (not (at-location haight)))
                 (at end (at-location sunset))
                 (increase (clock) 1))
  )

  (:durative-action travel-you-sunset-to-haight_A
    :duration (= ?d 1)
    :condition (and (at start (at-location sunset)))
    :effect (and (at end (not (at-location sunset)))
                 (at end (at-location haight))
                 (increase (clock) 1))
  )

  ; Travel actions for Jessica (Agent B)
  (:durative-action travel-jessica-haight-to-sunset_B
    :duration (= ?d 1)
    :condition (and (at start (at jessica haight)))
    :effect (and (not (at jessica haight))
                 (at end (at jessica sunset))
                 (increase (clock) 1))
  )

  (:durative-action travel-jessica-sunset-to-haight_B
    :duration (= ?d 1)
    :condition (and (at start (at jessica sunset)))
    :effect (and (not (at jessica sunset))
                 (at end (at jessica haight))
                 (increase (clock) 1))
  )

  ; Waiting action for you
  (:durative-action wait_A
     :parameters (?l - loc)
     :duration (= ?d 1)
     :condition (and (at start (at-location ?l)))
     :effect (increase (clock) 1)
  )

  ; Meeting actions (two distinct actions to reflect the two agents’ meeting representations)
  ; Meeting must start when you and Jessica are both at Sunset, and within the allowed 3:15 PM - 6:45 PM window
  ; Duration is 6 units (90 minutes)

  (:durative-action meet-jessica_A
     :duration (= ?d 6)
     :condition (and (at start (at-location sunset))
                     (at start (at jessica sunset))
                     (>= (clock) 25)
                     (<= (+ (clock) 6) 45))
     :effect (and (increase (clock) 6)
                  (met))
  )

  ; Alternative meeting action from Agent B (to preserve distinct action naming)
  (:durative-action meet-90_B
     :duration (= ?d 6)
     :condition (and (at start (at-location sunset))
                     (at start (at jessica sunset))
                     (>= (clock) 25)
                     (<= (+ (clock) 6) 45))
     :effect (and (increase (clock) 6)
                  (met))
  )
)