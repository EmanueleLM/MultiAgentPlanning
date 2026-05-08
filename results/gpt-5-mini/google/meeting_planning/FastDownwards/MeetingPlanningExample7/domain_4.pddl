(define (domain meeting_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types person location slot)

  (:predicates
    (at ?p - person ?loc - location ?s - slot)        ; person ?p is at location ?loc at time slot ?s
    (slot-next ?s1 - slot ?s2 - slot)                ; ?s2 immediately follows ?s1
    (busy ?p - person ?s - slot)                     ; person ?p is occupied during slot ?s
    (travel-two ?from - location ?to - location)     ; a travel edge that requires two consecutive slots
    (met ?p - person)                                ; person ?p has been met for required duration
    (is_traveler ?p - person)                        ; unary marker: the day traveler
    (is_friend ?p - person)                          ; unary marker: a friend
  )

  ;; wait: advance traveler presence from slot ?s to the immediate next slot ?s2
  (:action wait
    :parameters (?p - person ?loc - location ?s - slot ?s2 - slot)
    :precondition (and
      (is_traveler ?p)
      (at ?p ?loc ?s)
      (slot-next ?s ?s2)
      (not (busy ?p ?s2))
    )
    :effect (and
      (at ?p ?loc ?s2)
    )
  )

  ;; travel_two: conservative two-slot travel (covers both 17 and 18 minute legs)
  (:action travel_two
    :parameters (?p - person ?from - location ?to - location ?s - slot ?s1 - slot ?s2 - slot)
    :precondition (and
      (is_traveler ?p)
      (travel-two ?from ?to)
      (at ?p ?from ?s)
      (slot-next ?s ?s1)
      (slot-next ?s1 ?s2)
      (not (busy ?p ?s1))
      (not (busy ?p ?s2))
    )
    :effect (and
      ;; arrive at destination at the end of the two-slot travel window
      (at ?p ?to ?s2)
      ;; mark intermediate and arrival slots as busy (travel consumes them)
      (busy ?p ?s1)
      (busy ?p ?s2)
    )
  )

  ;; meet_five: meeting that occupies five consecutive 15-minute slots (5 * 15 = 75 minutes)
  ;; requires both participants to be co-present and not busy for those five slots
  (:action meet_five
    :parameters (?t - person ?f - person ?loc - location
                 ?s - slot ?s1 - slot ?s2 - slot ?s3 - slot ?s4 - slot)
    :precondition (and
      (is_traveler ?t)
      (is_friend ?f)

      ;; five consecutive slots
      (slot-next ?s ?s1)
      (slot-next ?s1 ?s2)
      (slot-next ?s2 ?s3)
      (slot-next ?s3 ?s4)

      ;; both present at the location for each of the five slots
      (at ?t ?loc ?s)  (at ?t ?loc ?s1)  (at ?t ?loc ?s2)  (at ?t ?loc ?s3)  (at ?t ?loc ?s4)
      (at ?f ?loc ?s)  (at ?f ?loc ?s1)  (at ?f ?loc ?s2)  (at ?f ?loc ?s3)  (at ?f ?loc ?s4)

      ;; neither is busy in any of the five slots
      (not (busy ?t ?s))  (not (busy ?t ?s1))  (not (busy ?t ?s2))  (not (busy ?t ?s3))  (not (busy ?t ?s4))
      (not (busy ?f ?s))  (not (busy ?f ?s1))  (not (busy ?f ?s2))  (not (busy ?f ?s3))  (not (busy ?f ?s4))
    )
    :effect (and
      ;; occupy both participants for the five slots
      (busy ?t ?s) (busy ?t ?s1) (busy ?t ?s2) (busy ?t ?s3) (busy ?t ?s4)
      (busy ?f ?s) (busy ?f ?s1) (busy ?f ?s2) (busy ?f ?s3) (busy ?f ?s4)

      ;; ensure they are recorded at the meeting location at the end slot
      (at ?t ?loc ?s4)
      (at ?f ?loc ?s4)

      ;; record that the friend has been met for the required minimum
      (met ?f)
    )
  )
)