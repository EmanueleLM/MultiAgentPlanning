(define (domain multi-agent-tower)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg agent)
  (:predicates
    ; disk d is directly on object x (x may be a peg or another disk)
    (on ?d - disk ?x - object)
    ; nothing directly on top of object x (x may be a peg or a disk)
    (clear ?x - object)
    ; agent a is holding disk d
    (holding ?a - agent ?d - disk)
    ; agent a's hand is empty
    (handempty ?a - agent)
    ; size ordering: first disk is strictly smaller than second disk
    (smaller ?d1 - disk ?d2 - disk)
  )

  ; -------------------------
  ; ACTIONS FOR AGENT1
  ; -------------------------

  (:action pickup-from-peg-agent1
    :parameters (?d - disk ?p - peg)
    :precondition (and (on ?d ?p) (clear ?d) (handempty agent1))
    :effect (and
      (holding agent1 ?d)
      (not (on ?d ?p))
      (not (handempty agent1))
      (clear ?p)
      (not (clear ?d))
    )
  )

  (:action pickup-from-disk-agent1
    :parameters (?d - disk ?support - disk)
    :precondition (and (on ?d ?support) (clear ?d) (handempty agent1))
    :effect (and
      (holding agent1 ?d)
      (not (on ?d ?support))
      (not (handempty agent1))
      (clear ?support)
      (not (clear ?d))
    )
  )

  (:action put-on-peg-agent1
    :parameters (?d - disk ?p - peg)
    :precondition (and (holding agent1 ?d) (clear ?p))
    :effect (and
      (on ?d ?p)
      (not (holding agent1 ?d))
      (handempty agent1)
      (not (clear ?p))
      (clear ?d)
    )
  )

  (:action put-on-disk-agent1
    :parameters (?d - disk ?support - disk)
    :precondition (and (holding agent1 ?d) (clear ?support) (smaller ?d ?support))
    :effect (and
      (on ?d ?support)
      (not (holding agent1 ?d))
      (handempty agent1)
      (not (clear ?support))
      (clear ?d)
    )
  )

  ; -------------------------
  ; ACTIONS FOR AGENT2
  ; -------------------------

  (:action pickup-from-peg-agent2
    :parameters (?d - disk ?p - peg)
    :precondition (and (on ?d ?p) (clear ?d) (handempty agent2))
    :effect (and
      (holding agent2 ?d)
      (not (on ?d ?p))
      (not (handempty agent2))
      (clear ?p)
      (not (clear ?d))
    )
  )

  (:action pickup-from-disk-agent2
    :parameters (?d - disk ?support - disk)
    :precondition (and (on ?d ?support) (clear ?d) (handempty agent2))
    :effect (and
      (holding agent2 ?d)
      (not (on ?d ?support))
      (not (handempty agent2))
      (clear ?support)
      (not (clear ?d))
    )
  )

  (:action put-on-peg-agent2
    :parameters (?d - disk ?p - peg)
    :precondition (and (holding agent2 ?d) (clear ?p))
    :effect (and
      (on ?d ?p)
      (not (holding agent2 ?d))
      (handempty agent2)
      (not (clear ?p))
      (clear ?d)
    )
  )

  (:action put-on-disk-agent2
    :parameters (?d - disk ?support - disk)
    :precondition (and (holding agent2 ?d) (clear ?support) (smaller ?d ?support))
    :effect (and
      (on ?d ?support)
      (not (holding agent2 ?d))
      (handempty agent2)
      (not (clear ?support))
      (clear ?d)
    )
  )

)