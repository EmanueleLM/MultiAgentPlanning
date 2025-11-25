(define (domain blocksworld)
  (:requirements :strips :typing :negative-preconditions)
  (:types object)

  (:predicates
    (block ?x - object)           ; classifies blocks
    (table ?t - object)           ; the table object
    (stage ?s - object)           ; discrete time/stage objects
    (next ?s1 - object ?s2 - object) ; successor relation between stages
    (current ?s - object)         ; which stage is currently active (unique)
    (on ?x - object ?y - object)  ; x is directly on y (y can be a block or the table)
    (ontable ?x - object)         ; x is on the table
    (clear ?x - object)           ; nothing is on x (and it's not held)
    (holding ?x - object)         ; agent is holding x
    (handempty)                   ; agent's hand is empty
  )

  ;; Pick up a block from the table at a given stage; advances current stage to its successor.
  (:action pickup
    :parameters (?x - object ?s - object ?s2 - object)
    :precondition (and
      (block ?x)
      (ontable ?x)
      (clear ?x)
      (handempty)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (holding ?x)
      (not (ontable ?x))
      (not (on ?x ?x))            ; harmless self-op; kept to avoid accidental leftovers (no-op if not present)
      (not (clear ?x))
      (not (handempty))
      (not (current ?s))
      (current ?s2)
      (not (on ?x ?s))            ; ensure no spurious on-to-stage facts
      (not (on ?x ?x))            ; ensure cleanliness of on-predicates
      (not (on ?x ?s2))
      (not (on ?x ?s)) 
      (not (on ?x ?s2))
      ;; remove explicit on-to-table if present
      (not (on ?x ?y))            ; remove any on relation for ?x (will be re-added by stack/putdown as appropriate)
    )
  )

  ;; Put a held block down onto the table at a given stage; advances current stage.
  (:action putdown
    :parameters (?x - object ?s - object ?s2 - object)
    :precondition (and
      (block ?x)
      (holding ?x)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (ontable ?x)
      (on ?x table)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Unstack a clear block ?x from on top of block ?y at a given stage; advances current stage.
  (:action unstack
    :parameters (?x - object ?y - object ?s - object ?s2 - object)
    :precondition (and
      (block ?x)
      (block ?y)
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (holding ?x)
      (clear ?y)
      (not (on ?x ?y))
      (not (clear ?x))
      (not (handempty))
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Stack a held block ?x onto a clear block ?y at a given stage; advances current stage.
  (:action stack
    :parameters (?x - object ?y - object ?s - object ?s2 - object)
    :precondition (and
      (block ?x)
      (block ?y)
      (holding ?x)
      (clear ?y)
      (current ?s)
      (next ?s ?s2)
    )
    :effect (and
      (on ?x ?y)
      (clear ?x)
      (handempty)
      (not (holding ?x))
      (not (clear ?y))
      (not (ontable ?x))
      (not (current ?s))
      (current ?s2)
    )
  )
)