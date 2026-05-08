(define (domain meeting_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types person location slot)

  (:predicates
    (at ?p - person ?loc - location ?s - slot)        ; person ?p is at location ?loc at time slot ?s
    (slot-next ?s1 - slot ?s2 - slot)                ; ?s2 immediately follows ?s1
    (busy ?p - person ?s - slot)                     ; person ?p is occupied during slot ?s
    (travel-two ?from - location ?to - location)     ; a two-slot travel edge from ?from to ?to
    (met ?p - person)                                ; person ?p has been met for required duration
    (is_traveler ?p - person)                        ; unary marker: this person is the day traveler
    (is_friend ?p - person)                          ; unary marker: this person is a friend to meet
  )

  ;; wait one slot: advance presence at same location by one slot (traveler only)
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

  ;; travel that consumes two consecutive slots (conservative encoding for 17/18 minutes)
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
      (at ?p ?to ?s2)
      (busy ?p ?s1)
      (busy ?p ?s2)
    )
  )

  ;; meeting that requires five consecutive 15-minute slots (5 * 15 = 75 minutes)
  ;; traveler and friend must both be present at the same location for five consecutive slots and not busy
  ;; effects mark those five slots busy for both and record that the friend was met
  (:action meet_five
    :parameters (?t - person ?f - person ?loc - location
                 ?s - slot ?s1 - slot ?s2 - slot ?s3 - slot ?s4 - slot)
    :precondition (and
      (is_traveler ?t)
      (is_friend ?f)

      ;; consecutive slot chain
      (slot-next ?s ?s1)
      (slot-next ?s1 ?s2)
      (slot-next ?s2 ?s3)
      (slot-next ?s3 ?s4)

      ;; presence for all five consecutive slots (traveler)
      (at ?t ?loc ?s)
      (at ?t ?loc ?s1)
      (at ?t ?loc ?s2)
      (at ?t ?loc ?s3)
      (at ?t ?loc ?s4)

      ;; presence for all five consecutive slots (friend)
      (at ?f ?loc ?s)
      (at ?f ?loc ?s1)
      (at ?f ?loc ?s2)
      (at ?f ?loc ?s3)
      (at ?f ?loc ?s4)

      ;; neither is busy in any of the five slots
      (not (busy ?t ?s))
      (not (busy ?t ?s1))
      (not (busy ?t ?s2))
      (not (busy ?t ?s3))
      (not (busy ?t ?s4))

      (not (busy ?f ?s))
      (not (busy ?f ?s1))
      (not (busy ?f ?s2))
      (not (busy ?f ?s3))
      (not (busy ?f ?s4))
    )
    :effect (and
      ;; occupy both participants for the five slots
      (busy ?t ?s) (busy ?t ?s1) (busy ?t ?s2) (busy ?t ?s3) (busy ?t ?s4)
      (busy ?f ?s) (busy ?f ?s1) (busy ?f ?s2) (busy ?f ?s3) (busy ?f ?s4)

      ;; both are at the meeting location at the end of the meeting window
      (at ?t ?loc ?s4)
      (at ?f ?loc ?s4)

      ;; record that the friend has been met for the required minimum
      (met ?f)
    )
  )
)