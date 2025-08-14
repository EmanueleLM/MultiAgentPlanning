(define (domain blocks)
  (:requirements :typing)
  (:types block - object)

  ;; ----- Predicates ----------------------------------------------------
  ;;  ont    – the block is on the table
  ;;  clear  – the block has no other block on top of it
  ;;  on     – block A is directly on block B
  (:predicates
    (ontable  ?b - block)
    (clear    ?b - block)
    (on       ?b1 - block ?b2 - block)
  )

  ;; ----- Move the block onto the table --------------------------------
  (:action move-to-table
    :parameters (?b ?s - block)
    :precondition (and
                    (clear ?b)               ; block to move is clear
                    (clear ?s)               ; the block that currently supports ?b must also be clear
                    (on     ?b ?s)           ; ?b is supported by ?s
                    (not (ontable ?b))       ; ?b must not already be on the table
                  )
    :effect (and
              (ontable ?b)                 ; ?b is now on the table
              (not (on ?b ?s))             ; old support removed
              (clear ?s)                   ; old support becomes clear
              (not (clear ?b))             ; ?b is no longer clear
            )
  )

  ;; ----- Move the block onto another clear block -----------------------
  (:action move-to-block
    :parameters (?b ?t ?s - block)
    :precondition (and
                    (clear ?b)                   ; block to move is clear
                    (clear ?t)                   ; target block is clear
                    (on     ?b ?s)               ; ?b is supported by ?s
                    (not (ontable ?b))           ; ?b must not already be on the table
                    (not (eq ?b ?t))             ; cannot put a block on top of itself
                  )
    :effect (and
              (on     ?b ?t)                 ; ?b is now on the target block
              (not (on   ?b ?s))             ; old support removed
              (clear  ?s)                    ; old support becomes clear
              (not (clear ?b))               ; ?b is no longer clear
              (not (clear ?t))               ; target block is no longer clear
            )
  )
)