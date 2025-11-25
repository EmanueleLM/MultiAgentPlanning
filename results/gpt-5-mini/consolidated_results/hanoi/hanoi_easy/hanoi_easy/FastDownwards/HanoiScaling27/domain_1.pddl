(define (domain hanoi-mover-4)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg - place stage)

  (:predicates
    ;; dynamic world state (current, not time-stamped; progression controlled by (now ?s))
    (on ?d - disk ?p - place)        ; disk ?d is directly on place ?p (peg or disk)
    (clear ?p - place)              ; nothing is on top of place ?p
    ;; static size ordering
    (smaller ?d1 - disk ?d2 - disk) ; ?d1 is strictly smaller than ?d2
    ;; discrete stage ordering / clock
    (succ ?s1 - stage ?s2 - stage)  ; immediate successor relation between stages
    (now ?s - stage)                ; current stage marker (exactly one true at a time)
  )

  ;; Move a top disk onto an empty peg, advancing the global stage by one successor.
  (:action mover-move-to-peg
    :parameters (?d - disk ?from - place ?to - peg ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)      ; ?d must be top of its stack
      (clear ?to)     ; peg ?to must be empty (move-to-peg is only for empty pegs)
    )
    :effect (and
      ;; move disk
      (not (on ?d ?from))
      (on ?d ?to)
      ;; update clear/top relationships
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
      ;; advance the single global stage marker (enforces exactly one action per stage)
      (not (now ?s))
      (now ?s2)
    )
  )

  ;; Move a top disk onto another disk (destination must be larger), advancing stage.
  (:action mover-move-to-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (now ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)         ; ?d must be top
      (clear ?to)        ; ?to must be the top disk of its stack
      (smaller ?d ?to)   ; cannot place larger disk on smaller
    )
    :effect (and
      ;; move disk
      (not (on ?d ?from))
      (on ?d ?to)
      ;; update clear/top relationships
      (not (clear ?to))
      (clear ?from)
      (clear ?d)
      ;; advance the single global stage marker
      (not (now ?s))
      (now ?s2)
    )
  )
)