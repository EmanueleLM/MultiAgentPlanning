(define (domain hanoi-4disks-3pegs)
  (:requirements :strips :typing :negative-preconditions)
  (:types obj stage)

  (:predicates
    (disk ?o - obj)             ; marks disk objects
    (peg ?o - obj)              ; marks peg objects
    (on ?d - obj ?p - obj)      ; disk ?d is directly on ?p (peg or disk)
    (clear ?o - obj)            ; place ?o (peg or disk) has nothing on top of it
    (smaller ?x - obj ?y - obj) ; true if disk ?x is strictly smaller than disk ?y
    (current ?s - stage)        ; which stage / time step is active
    (succ ?s1 - stage ?s2 - stage) ; successor relation over stages
  )

  ;; Move a top disk onto an empty peg (sequentialized by stages).
  (:action move-to-peg
    :parameters (?d - obj ?from - obj ?peg - obj ?s - stage ?s2 - stage)
    :precondition (and
      (disk ?d)
      (peg ?peg)
      (on ?d ?from)     ; ?d is currently directly on ?from (peg or disk)
      (clear ?d)        ; ?d is topmost on its stack
      (clear ?peg)      ; destination peg is empty (top)
      (current ?s)      ; we are executing at stage ?s
      (succ ?s ?s2)     ; ?s2 is the successor stage
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (clear ?from)       ; the place we moved from becomes clear (now top)
      (not (clear ?peg))  ; destination peg is no longer clear
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk onto another top disk (only allowed if moving disk is smaller).
  (:action move-onto-disk
    :parameters (?d - obj ?from - obj ?to - obj ?s - stage ?s2 - stage)
    :precondition (and
      (disk ?d)
      (disk ?to)
      (on ?d ?from)     ; ?d is currently directly on ?from (peg or disk)
      (clear ?d)        ; ?d is topmost on its stack
      (clear ?to)       ; destination disk must be topmost
      (smaller ?d ?to)  ; enforce that ?d is strictly smaller than ?to
      (current ?s)      ; we are executing at stage ?s
      (succ ?s ?s2)     ; ?s2 is the successor stage
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)       ; the place we moved from becomes clear (now top)
      (not (clear ?to))   ; destination disk is no longer clear (has ?d on top)
      (not (current ?s))
      (current ?s2)
    )
  )
)