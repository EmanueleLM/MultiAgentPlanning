(define (domain stacking)
  (:requirements :strips :typing :negative-preconditions)
  (:types
    support - object
    crate pallet - support
    robot - object
  )
  (:predicates
    (on ?c - crate ?s - support)        ; crate c is directly on support s (crate or pallet)
    (clear ?s - support)                ; there is nothing on top of support s
    (holding ?r - robot ?c - crate)     ; robot r is holding crate c
    (handempty ?r - robot)              ; robot r is not holding anything
  )

  ;; Pick up a clear crate from a support (pallet or crate)
  (:action pick-up
    :parameters (?r - robot ?c - crate ?s - support)
    :precondition (and
      (on ?c ?s)
      (clear ?c)
      (handempty ?r)
    )
    :effect (and
      (holding ?r ?c)
      (not (on ?c ?s))
      (not (clear ?c))
      (clear ?s)
      (not (handempty ?r))
    )
  )

  ;; Put down a held crate onto a clear support (pallet or crate)
  (:action put-down
    :parameters (?r - robot ?c - crate ?s - support)
    :precondition (and
      (holding ?r ?c)
      (clear ?s)
    )
    :effect (and
      (on ?c ?s)
      (clear ?c)
      (not (clear ?s))
      (not (holding ?r ?c))
      (handempty ?r)
    )
  )
)