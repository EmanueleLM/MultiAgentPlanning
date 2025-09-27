(define (domain meeting-schedule)
  (:requirements :strips :typing)
  (:types agent slot)
  (:predicates
    (free ?a - agent ?s - slot)
    (attended ?a - agent ?s - slot)
    (meeting-scheduled ?s - slot)
  )

  (:action attend
    :parameters (?a - agent ?s - slot)
    :precondition (free ?a ?s)
    :effect (attended ?a ?s)
  )

  (:action confirm
    :parameters (?s - slot ?k - agent ?b - agent ?d - agent ?l - agent)
    :precondition (and
      (attended ?k ?s)
      (attended ?b ?s)
      (attended ?d ?s)
      (attended ?l ?s)
    )
    :effect (meeting-scheduled ?s)
  )
)