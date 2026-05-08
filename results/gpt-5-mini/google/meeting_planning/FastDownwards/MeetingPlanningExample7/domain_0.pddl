(define (domain orchestrator)
  (:requirements :strips :typing :negative-preconditions)
  (:types person location slot)
  (:predicates
    (at ?p - person ?l - location ?s - slot)         ; person at location at slot
    (busy ?p - person ?s - slot)                    ; person occupied/unavailable at slot (travel or meeting)
    (slot-next ?s1 - slot ?s2 - slot)               ; immediate successor relation on slots
    (john-available ?s - slot)                      ; John available during slot
    (available ?p - person ?s - slot)               ; person available during slot
    (duration1 ?from - location ?to - location)     ; travel takes 1 slot between these locations
    (duration2 ?from - location ?to - location)     ; travel takes 2 slots between these locations
    (met ?p - person)                               ; John has met this person (friend)
  )

  ;; John waits one slot at the same location (non-busy wait to allow meetings to start next slot)
  (:action john-wait
    :parameters (?loc - location ?s - slot ?s2 - slot)
    :precondition (and
      (at john ?loc ?s)
      (slot-next ?s ?s2)
      (john-available ?s2)
      (not (busy john ?s2))
      ;; ensure John is not already recorded at any location for the target slot (avoid duplicate at facts)
      (not (at john office ?s2))
      (not (at john cafe1 ?s2))
      (not (at john cafe2 ?s2))
      (not (at john park ?s2))
    )
    :effect (and
      (at john ?loc ?s2)
    )
  )

  ;; John travels between locations taking 1 slot (arrival slot is consumed and marked busy)
  (:action john-travel-1
    :parameters (?from - location ?to - location ?s - slot ?s2 - slot)
    :precondition (and
      (duration1 ?from ?to)
      (at john ?from ?s)
      (slot-next ?s ?s2)
      (john-available ?s2)
      (not (busy john ?s2))
      ;; ensure arrival slot is not already occupied by John at any location
      (not (at john office ?s2))
      (not (at john cafe1 ?s2))
      (not (at john cafe2 ?s2))
      (not (at john park ?s2))
    )
    :effect (and
      (at john ?to ?s2)
      (busy john ?s2)
    )
  )

  ;; John travels between locations taking 2 slots (both intermediate and arrival slots are busy)
  (:action john-travel-2
    :parameters (?from - location ?to - location ?s - slot ?sMid - slot ?s2 - slot)
    :precondition (and
      (duration2 ?from ?to)
      (at john ?from ?s)
      (slot-next ?s ?sMid)
      (slot-next ?sMid ?s2)
      (john-available ?sMid)
      (john-available ?s2)
      (not (busy john ?sMid))
      (not (busy john ?s2))
      ;; ensure middle and arrival slots are not already occupied by John
      (not (at john office ?sMid))  (not (at john cafe1 ?sMid))  (not (at john cafe2 ?sMid))  (not (at john park ?sMid))
      (not (at john office ?s2))    (not (at john cafe1 ?s2))    (not (at john cafe2 ?s2))    (not (at john park ?s2))
    )
    :effect (and
      (at john ?to ?s2)
      (busy john ?sMid)
      (busy john ?s2)
    )
  )

  ;; John meets Alice: Alice requires a 2-slot contiguous meeting at the same location.
  (:action john-meet-alice
    :parameters (?loc - location ?s - slot ?s2 - slot)
    :precondition (and
      ;; contiguous two-slot meeting
      (slot-next ?s ?s2)
      ;; Alice must be present and available in both slots at the location
      (at alice ?loc ?s)
      (at alice ?loc ?s2)
      (available alice ?s)
      (available alice ?s2)
      ;; John must be present at the meeting location at the start slot and available for both slots
      (at john ?loc ?s)
      (john-available ?s)
      (john-available ?s2)
      ;; neither slot must be busy for John (no travel or other meeting)
      (not (busy john ?s))
      (not (busy john ?s2))
      ;; ensure John is not already recorded at any location for the second slot (avoid conflicting at facts)
      (not (at john office ?s2))
      (not (at john cafe1 ?s2))
      (not (at john cafe2 ?s2))
      (not (at john park ?s2))
    )
    :effect (and
      ;; mark John occupied during both slots and record meeting
      (busy john ?s)
      (busy john ?s2)
      (at john ?loc ?s2)
      (met alice)
    )
  )

  ;; John meets Bob: Bob requires a 1-slot meeting at the same location.
  (:action john-meet-bob
    :parameters (?loc - location ?s - slot)
    :precondition (and
      (at bob ?loc ?s)
      (available bob ?s)
      (at john ?loc ?s)
      (john-available ?s)
      (not (busy john ?s))
    )
    :effect (and
      (busy john ?s)
      (met bob)
    )
  )
)