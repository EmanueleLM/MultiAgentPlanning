(define (domain hanoi-4disks-3pegs)
  (:requirements :strips :typing :negative-preconditions)
  ;; place is a supertype that can be a peg or a disk
  (:types place disk peg stage)

  (:predicates
    ;; disk is directly on a place (a peg or another disk)
    (on ?d - disk ?p - place)
    ;; a place (peg or disk) has nothing on top of it (is topmost)
    (clear ?p - place)
    ;; static strict size ordering among disks
    (smaller ?x - disk ?y - disk)
    ;; current stage marker and successor relation to enforce one action per stage
    (current ?s - stage)
    (succ ?s1 - stage ?s2 - stage)
  )

  ;; Move a top disk from any place onto an empty peg, advancing the explicit stage.
  (:action move-to-peg
    :parameters (?d - disk ?from - place ?peg - peg ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)       ; ?d is directly on ?from (peg or disk)
      (clear ?d)          ; ?d is topmost at its current place
      (clear ?peg)        ; destination peg must be empty (topmost)
      (current ?s)        ; action executes at current stage ?s
      (succ ?s ?s2)       ; and advances to successor stage ?s2
      (not (= ?from ?peg)) ; must change place (no no-op moves)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?peg)
      (clear ?from)        ; the place that lost the top disk becomes topmost
      (not (clear ?peg))   ; destination peg is no longer empty
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move a top disk from any place onto another top disk (only if smaller), advancing stage.
  (:action move-onto-disk
    :parameters (?d - disk ?from - place ?to - disk ?s - stage ?s2 - stage)
    :precondition (and
      (on ?d ?from)       ; ?d is directly on ?from
      (clear ?d)          ; ?d is topmost at its current place
      (clear ?to)         ; destination disk must be topmost
      (smaller ?d ?to)    ; size constraint: moving disk must be strictly smaller
      (current ?s)        ; executing at current stage ?s
      (succ ?s ?s2)       ; advance to successor stage ?s2
      (not (= ?from ?to)) ; must change place (no no-op)
    )
    :effect (and
      (not (on ?d ?from))
      (on ?d ?to)
      (clear ?from)       ; place that lost top disk becomes topmost
      (not (clear ?to))   ; destination disk no longer topmost
      (not (current ?s))
      (current ?s2)
    )
  )
)