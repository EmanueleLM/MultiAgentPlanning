(define (domain stacked-blocks-phased)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (agent ?a)
    (block ?b)
    (table ?t)
    (phase ?p)

    ;; hand / holding
    (handempty ?a)
    (holding ?a ?b)

    ;; spatial relations
    (on ?b ?s)            ;; block on table or block: s can be 'table' or another block (represented as objects)
    (on-table ?b)         ;; convenience: block directly on table
    (clear ?b)            ;; nothing on top of b

    ;; ordering / sequencing
    (requires-phase ?b ?s ?p)  ;; to place block b onto s requires phase p to be active
    (phase-active ?p)
    (phase-completed ?p)
    (next-phase ?p ?q)

    ;; completion markers
    (stacked ?b ?s)
  )

  ;; Pick up a clear block from the table with agent's empty hand
  (:action pickup-table
    :parameters (?ag ?b ?t)
    :precondition (and (agent ?ag) (block ?b) (table ?t) (handempty ?ag) (clear ?b) (on ?b ?t))
    :effect (and
      (not (on ?b ?t))
      (not (on-table ?b))
      (holding ?ag ?b)
      (not (handempty ?ag))
      ;; while held, we consider the block not to be on any surface; it should not be considered clear (top property not relevant while held)
      (not (clear ?b))
    )
  )

  ;; Unstack a clear top block from another block
  (:action unstack
    :parameters (?ag ?b ?under)
    :precondition (and (agent ?ag) (block ?b) (block ?under) (handempty ?ag) (clear ?b) (on ?b ?under))
    :effect (and
      (not (on ?b ?under))
      (holding ?ag ?b)
      (not (handempty ?ag))
      ;; the block under becomes clear after removing the top
      (clear ?under)
      ;; the block being held is no longer considered clear (it is being manipulated)
      (not (clear ?b))
    )
  )

  ;; Put down a held block onto the table
  (:action putdown-table
    :parameters (?ag ?b ?t)
    :precondition (and (agent ?ag) (block ?b) (table ?t) (holding ?ag ?b))
    :effect (and
      (not (holding ?ag ?b))
      (handempty ?ag)
      (on ?b ?t)
      (on-table ?b)
      (clear ?b)
    )
  )

  ;; Stack a held block onto another block, consuming the current phase and activating the next phase
  ;; This action enforces sequencing: it can only be used for specific (block,support) pairs that are mapped to a phase via requires-phase.
  (:action stack-onto-with-next
    :parameters (?ag ?b ?s ?p ?q)
    :precondition (and
      (agent ?ag) (block ?b) (block ?s) (phase ?p) (phase ?q)
      (holding ?ag ?b)
      (clear ?s)
      (requires-phase ?b ?s ?p)
      (phase-active ?p)
      (next-phase ?p ?q)
    )
    :effect (and
      (not (holding ?ag ?b))
      (handempty ?ag)
      ;; place b on s
      (on ?b ?s)
      (not (on ?b ?s)) ;; ensure consistent deletion before add: planner will handle deletes; keep this line harmless
      (on ?b ?s)
      ;; s is no longer clear; b (now top) is clear
      (not (clear ?s))
      (clear ?b)
      ;; mark completion of this stack step and phase transition
      (stacked ?b ?s)
      (phase-completed ?p)
      (not (phase-active ?p))
      (phase-active ?q)
    )
  )
)