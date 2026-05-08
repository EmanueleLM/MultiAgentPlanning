(define (domain meeting_planning)
  (:requirements :strips :typing :negative-preconditions)
  (:types person location slot)

  (:predicates
    (at ?p - person ?loc - location ?s - slot)        ; person ?p is at location ?loc at time slot ?s
    (slot-next ?s1 - slot ?s2 - slot)                ; ?s2 immediately follows ?s1
    (busy ?p - person ?s - slot)                     ; person ?p is occupied during slot ?s
    (travel-two ?from - location ?to - location)     ; a two-slot travel edge from ?from to ?to
    (met ?p - person)                                ; person ?p has been met for required duration
  )

  ;; wait one slot: advance presence at same location by one slot
  (:action wait
    :parameters (?p - person ?loc - location ?s - slot ?s2 - slot)
    :precondition (and
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
  ;; both participants must be at the same location for five consecutive slots and not busy
  ;; effects mark those five slots busy for both and record that the friend was met
  (:action meet_five
    :parameters (?p - person ?friend - person ?loc - location
                 ?s - slot ?s1 - slot ?s2 - slot ?s3 - slot ?s4 - slot)
    :precondition (and
      (slot-next ?s ?s1)
      (slot-next ?s1 ?s2)
      (slot-next ?s2 ?s3)
      (slot-next ?s3 ?s4)

      ;; presence for all five consecutive slots
      (at ?p ?loc ?s)
      (at ?p ?loc ?s1)
      (at ?p ?loc ?s2)
      (at ?p ?loc ?s3)
      (at ?p ?loc ?s4)

      (at ?friend ?loc ?s)
      (at ?friend ?loc ?s1)
      (at ?friend ?loc ?s2)
      (at ?friend ?loc ?s3)
      (at ?friend ?loc ?s4)

      ;; neither is busy in any of the five slots
      (not (busy ?p ?s))
      (not (busy ?p ?s1))
      (not (busy ?p ?s2))
      (not (busy ?p ?s3))
      (not (busy ?p ?s4))

      (not (busy ?friend ?s))
      (not (busy ?friend ?s1))
      (not (busy ?friend ?s2))
      (not (busy ?friend ?s3))
      (not (busy ?friend ?s4))
    )
    :effect (and
      ;; occupy both participants for the five slots
      (busy ?p ?s) (busy ?p ?s1) (busy ?p ?s2) (busy ?p ?s3) (busy ?p ?s4)
      (busy ?friend ?s) (busy ?friend ?s1) (busy ?friend ?s2) (busy ?friend ?s3) (busy ?friend ?s4)

      ;; both are at the meeting location at the end of the meeting window
      (at ?p ?loc ?s4)
      (at ?friend ?loc ?s4)

      ;; record that the friend has been met for the required minimum
      (met ?friend)
    )
  )
)