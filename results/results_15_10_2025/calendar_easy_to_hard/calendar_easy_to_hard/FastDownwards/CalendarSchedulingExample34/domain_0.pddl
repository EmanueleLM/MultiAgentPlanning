(define (domain orchestrator)
  (:requirements :strips :typing :negative-preconditions :conditional-effects :fluents)
  (:types person slot)

  (:predicates
    (available ?p - person ?s - slot)
    (free ?p - person)
    (attending ?p - person ?s - slot)
    (meeting-scheduled)
    (meeting-at ?s - slot)
    (janice-pref ?s - slot)
    ; slot identity predicates used to encode slot ordering / cost
    (is-09-00 ?s - slot)
    (is-09-30 ?s - slot)
    (is-10-00 ?s - slot)
    (is-10-30 ?s - slot)
    (is-11-00 ?s - slot)
    (is-11-30 ?s - slot)
    (is-12-00 ?s - slot)
    (is-12-30 ?s - slot)
    (is-13-00 ?s - slot)
    (is-13-30 ?s - slot)
    (is-14-00 ?s - slot)
    (is-14-30 ?s - slot)
    (is-15-00 ?s - slot)
    (is-15-30 ?s - slot)
    (is-16-00 ?s - slot)
    (is-16-30 ?s - slot)
  )

  (:functions
    (total-cost)
  )

  ; Participant-specific "attend" actions -- keep each agent's action distinct
  (:action attend-christine
    :parameters (?s - slot)
    :precondition (and (available christine ?s) (free christine))
    :effect (and (attending christine ?s) (not (free christine)))
  )

  (:action attend-janice
    :parameters (?s - slot)
    :precondition (and (available janice ?s) (free janice))
    :effect (and (attending janice ?s) (not (free janice)))
  )

  (:action attend-bobby
    :parameters (?s - slot)
    :precondition (and (available bobby ?s) (free bobby))
    :effect (and (attending bobby ?s) (not (free bobby)))
  )

  (:action attend-elizabeth
    :parameters (?s - slot)
    :precondition (and (available elizabeth ?s) (free elizabeth))
    :effect (and (attending elizabeth ?s) (not (free elizabeth)))
  )

  (:action attend-tyler
    :parameters (?s - slot)
    :precondition (and (available tyler ?s) (free tyler))
    :effect (and (attending tyler ?s) (not (free tyler)))
  )

  (:action attend-edward
    :parameters (?s - slot)
    :precondition (and (available edward ?s) (free edward))
    :effect (and (attending edward ?s) (not (free edward)))
  )

  ; Start meeting once every participant has attended the same slot.
  ; The action carries conditional numeric effects to encode "earliest slot" priority
  ; (lower index -> lower added cost) and an extra soft penalty if Janice's preferred slot is not chosen.
  (:action start-meeting
    :parameters (?s - slot)
    :precondition (and
      (not (meeting-scheduled))
      (attending christine ?s)
      (attending janice ?s)
      (attending bobby ?s)
      (attending elizabeth ?s)
      (attending tyler ?s)
      (attending edward ?s)
    )
    :effect (and
      (meeting-scheduled)
      (meeting-at ?s)

      ; encode slot ordering cost (earlier slots have smaller added cost)
      (when (is-09-00 ?s)   (increase (total-cost) 0))
      (when (is-09-30 ?s)   (increase (total-cost) 1))
      (when (is-10-00 ?s)   (increase (total-cost) 2))
      (when (is-10-30 ?s)   (increase (total-cost) 3))
      (when (is-11-00 ?s)   (increase (total-cost) 4))
      (when (is-11-30 ?s)   (increase (total-cost) 5))
      (when (is-12-00 ?s)   (increase (total-cost) 6))
      (when (is-12-30 ?s)   (increase (total-cost) 7))
      (when (is-13-00 ?s)   (increase (total-cost) 8))
      (when (is-13-30 ?s)   (increase (total-cost) 9))
      (when (is-14-00 ?s)   (increase (total-cost) 10))
      (when (is-14-30 ?s)   (increase (total-cost) 11))
      (when (is-15-00 ?s)   (increase (total-cost) 12))
      (when (is-15-30 ?s)   (increase (total-cost) 13))
      (when (is-16-00 ?s)   (increase (total-cost) 14))
      (when (is-16-30 ?s)   (increase (total-cost) 15))

      ; soft preference: small penalty if Janice's preferred slot is not used
      (when (not (janice-pref ?s)) (increase (total-cost) 1))
    )
  )
)