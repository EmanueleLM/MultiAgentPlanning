(define (domain hanoi-domain-staged)
  (:requirements :strips :typing :negative-preconditions)
  (:types place stage)

  (:predicates
    (on ?d - place ?p - place)       ; disk ?d is directly on place ?p (disk or peg)
    (clear ?p - place)               ; nothing is on top of place ?p (peg or disk)
    (current ?s - stage)             ; current stage pointer
    (succ ?s1 - stage ?s2 - stage)   ; successor relation between stages
    (smaller ?d1 - place ?d2 - place); ?d1 is strictly smaller than ?d2 (applies to disks)
    (disk ?d - place)                ; object is a disk (typed as place)
    (peg ?p - place)                 ; object is a peg (typed as place)
  )

  ;; Move the top disk from any place onto an empty peg, advancing the stage by exactly one
  (:action move-to-peg
    :parameters (?d - place ?from - place ?to - place ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (disk ?d)
      (on ?d ?from)
      (clear ?d)      ; ?d is the top disk on its place
      (peg ?to)       ; destination must be a peg
      (clear ?to)     ; destination peg must be empty (top clear)
    )
    :effect (and
      ;; update disk position
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clearness
      (not (clear ?to))  ; destination no longer clear (now has ?d on top)
      (clear ?from)      ; origin becomes clear (its top removed)
      (clear ?d)         ; moved disk is top on destination

      ;; advance stage pointer (exactly one move per stage)
      (not (current ?s))
      (current ?s2)
    )
  )

  ;; Move the top disk from any place onto a clear disk (must be larger), advancing the stage by exactly one
  (:action move-to-disk
    :parameters (?d - place ?from - place ?to - place ?s - stage ?s2 - stage)
    :precondition (and
      (current ?s)
      (succ ?s ?s2)
      (disk ?d)
      (on ?d ?from)
      (clear ?d)         ; moving top disk
      (disk ?to)         ; destination must be a disk
      (clear ?to)        ; target disk must be top (clear)
      (smaller ?d ?to)   ; moved disk must be strictly smaller than destination disk
    )
    :effect (and
      ;; update disk position
      (not (on ?d ?from))
      (on ?d ?to)

      ;; update clearness
      (not (clear ?to))  ; destination disk no longer clear (now has ?d on top)
      (clear ?from)      ; origin becomes clear after removing top disk
      (clear ?d)         ; moved disk is now top and clear

      ;; advance stage pointer
      (not (current ?s))
      (current ?s2)
    )
  )
)