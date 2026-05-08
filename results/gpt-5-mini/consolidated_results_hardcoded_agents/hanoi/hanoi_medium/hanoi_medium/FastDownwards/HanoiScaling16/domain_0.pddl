(define (domain hanoi5)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)  ; disk and peg are separate types; step is separate
  (:predicates
    ;; structural predicates
    (on ?d - disk ?s - (either disk peg))    ; disk ?d is directly on support ?s (disk or peg)
    (clear ?s - (either disk peg))           ; nothing is on top of support ?s (disk or peg)
    ;; planning-control predicates to enforce the exact given ordering
    (cur ?st - step)                         ; current step marker
    (succ ?s - step ?s2 - step)              ; successor relation for steps
    (allowed-move ?s - step ?d - disk ?from - (either disk peg) ?to - peg)
    ;; size ordering: smaller ?a ?b means ?a is strictly smaller than ?b
    (smaller ?a - disk ?b - disk)
  )

  ;; Move to an empty peg (destination peg currently clear)
  (:action move-to-empty
    :parameters (?d - disk ?from - (either disk peg) ?to - peg ?s - step ?s2 - step)
    :precondition (and
      (cur ?s)
      (allowed-move ?s ?d ?from ?to)
      (on ?d ?from)
      (clear ?d)
      (clear ?to)
      (succ ?s ?s2)
    )
    :effect (and
      ;; relocate disk
      (not (on ?d ?from))
      (on ?d ?to)
      ;; update clearness: destination now not clear, moved disk is clear, its former support becomes clear
      (not (clear ?to))
      (clear ?d)
      (clear ?from)
      ;; advance step
      (not (cur ?s))
      (cur ?s2)
    )
  )

  ;; Move onto a disk that is the current top of the destination peg
  (:action move-onto-disk
    :parameters (?d - disk ?from - (either disk peg) ?to - peg ?top - disk ?s - step ?s2 - step)
    :precondition (and
      (cur ?s)
      (allowed-move ?s ?d ?from ?to)
      (on ?d ?from)
      (clear ?d)
      (on ?top ?to)            ; ?top is currently the top disk on peg ?to
      (clear ?top)
      (smaller ?d ?top)        ; must not place larger onto smaller
      (succ ?s ?s2)
    )
    :effect (and
      ;; relocate disk onto disk ?top
      (not (on ?d ?from))
      (on ?d ?top)
      ;; update clearness: top is no longer clear, moved disk is clear, former support becomes clear
      (not (clear ?top))
      (clear ?d)
      (clear ?from)
      ;; advance step
      (not (cur ?s))
      (cur ?s2)
    )
  )
)