(define (domain hanoi-domain-staged)
  (:requirements :strips :negative-preconditions)
  (:predicates
    (on ?d ?p)           ; disk ?d is directly on place ?p (disk or peg)
    (clear ?p)           ; nothing is on top of place ?p (peg or disk)
    (current ?s)         ; current stage pointer
    (succ ?s1 ?s2)       ; successor relation between stages
    (smaller ?d1 ?d2)    ; ?d1 is strictly smaller than ?d2
    (disk ?d)            ; object is a disk
    (peg ?p)             ; object is a peg
  )

  ;; Move the top disk from any place onto an empty peg, advancing the stage
  (:action move-to-peg
    :parameters (?d ?from ?to ?s ?s2)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)         ; ?d is the top disk on its place
      (clear ?to)        ; destination peg must be empty (top place clear)
      (peg ?to)          ; ensure destination is a peg
    )
    :effect (and
      ;; update disk position
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clearness
      (not (clear ?to))  ; destination now has something on it
      (clear ?from)      ; origin becomes clear after removing top disk
      (clear ?d)         ; moved disk is top, hence clear

      ;; advance stage pointer (exactly one move per stage)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move the top disk from any place onto a clear disk (must be larger), advancing the stage
  (:action move-to-disk
    :parameters (?d ?from ?to ?s ?s2)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (on ?d ?from)
      (clear ?d)         ; moving top disk
      (clear ?to)        ; target disk must be clear (top)
      (disk ?to)         ; ensure destination is a disk
      (smaller ?d ?to)   ; moved disk must be strictly smaller than destination disk
    )
    :effect (and
      ;; update disk position
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clearness
      (not (clear ?to))  ; destination disk no longer clear
      (clear ?from)      ; origin becomes clear after removing top disk
      (clear ?d)         ; moved disk is now top and clear

      ;; advance stage pointer
      (not (current ?s))
      (current ?s2)
    )
  )
)