(define (domain blocks-singlehanded)
  (:requirements :typing :strips :negative-preconditions)
  (:types block)

  (:predicates
    (on ?x - block ?y - block)
    (ontable ?x - block)
    (clear ?x - block)
    (holding ?x - block)
    (handempty)
    ;; control / ordering predicates to enforce the required serialization
    (allowed-unstack ?x - block ?y - block)   ;; permission to perform unstack(x,y)
    (allowed-putdown ?x - block)              ;; permission to perform put-down(x)
    (putdown-done ?x - block)                 ;; intermediate marker produced by put-down
    ;; static mapping: (enables ?x ?u ?v) means put-down of ?x should enable unstack(?u,?v)
    (enables ?x - block ?u - block ?v - block)
  )

  ;; Unstack a block x from block y. Requires explicit permission (allowed-unstack)
  ;; and that the hand is empty and x is clear.
  (:action unstack
    :parameters (?x - block ?y - block)
    :precondition (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (allowed-unstack ?x ?y)
    )
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (handempty))
      (not (clear ?x))
      ;; control updates: consume the allowed-unstack and enable a put-down for x
      (not (allowed-unstack ?x ?y))
      (allowed-putdown ?x)
    )
  )

  ;; Put the held block x down on the table. Requires explicit permission (allowed-putdown).
  ;; Produces putdown-done marker so a separate activate action can enable the next unstack.
  (:action put-down
    :parameters (?x - block)
    :precondition (and
      (holding ?x)
      (allowed-putdown ?x)
    )
    :effect (and
      (ontable ?x)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (allowed-putdown ?x))
      (putdown-done ?x)
    )
  )

  ;; Activate the next allowed-unstack based on a static mapping (enables).
  ;; This enforces that the mapping defined in the problem is used to create
  ;; the permission for the next unstack only after the corresponding put-down finished.
  (:action activate-next-after-putdown
    :parameters (?x - block ?u - block ?v - block)
    :precondition (and
      (putdown-done ?x)
      (enables ?x ?u ?v)
    )
    :effect (and
      (not (putdown-done ?x))
      (allowed-unstack ?u ?v)
    )
  )

  ;; Pick up a clear block from the table (not used in the provided instance-level plan,
  ;; but included to reflect provided capabilities).
  (:action pick-up
    :parameters (?x - block)
    :precondition (and
      (ontable ?x)
      (clear ?x)
      (handempty)
    )
    :effect (and
      (holding ?x)
      (not (ontable ?x))
      (not (handempty))
      (not (clear ?x))
    )
  )

  ;; Stack a held block x onto block y (not used in the provided instance-level plan,
  ;; but included to reflect provided capabilities).
  (:action stack
    :parameters (?x - block ?y - block)
    :precondition (and
      (holding ?x)
      (clear ?y)
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (clear ?y))
    )
  )
)