(define (domain meeting-domain)
  (:requirements :strips :typing :negative-preconditions)
  (:types agent slot)
  (:constants donna john billy - agent)
  (:predicates
    (free ?a - agent ?s - slot)
    (attended ?a - agent ?s - slot)
    (meeting-scheduled)
  )

  ;; Donna attends a specific 30-minute slot if she is free then
  (:action attend-donna
    :parameters (?s - slot)
    :precondition (free donna ?s)
    :effect (attended donna ?s)
  )

  ;; John attends a specific 30-minute slot if he is free then
  (:action attend-john
    :parameters (?s - slot)
    :precondition (free john ?s)
    :effect (attended john ?s)
  )

  ;; Billy attends a specific 30-minute slot if he is free then
  (:action attend-billy
    :parameters (?s - slot)
    :precondition (free billy ?s)
    :effect (attended billy ?s)
  )

  ;; Finalize the meeting when all three have attended the same slot
  (:action finalize-meeting
    :parameters (?s - slot)
    :precondition (and
      (attended donna ?s)
      (attended john ?s)
      (attended billy ?s)
    )
    :effect (meeting-scheduled)
  )
)