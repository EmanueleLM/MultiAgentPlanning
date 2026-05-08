(define (domain hanoi)
  (:requirements :strips :typing :negative-preconditions)
  (:types disk peg step)

  (:predicates
    ;; disk location relations
    (on-peg ?d - disk ?p - peg)      ;; disk directly on a peg (no disk below)
    (on-disk ?d - disk ?below - disk) ;; disk directly on another disk
    ;; top-of-structure relations
    (top ?p - peg ?d - disk)         ;; disk is the top disk of a peg
    (top-peg-empty ?p - peg)         ;; peg is empty (no top disk)
    ;; disk free-of-above marker
    (clear ?d - disk)                ;; no disk on top of ?d
    ;; size ordering
    (smaller ?d1 - disk ?d2 - disk)  ;; d1 is smaller than d2
    ;; discrete step control
    (current-step ?s - step)
    (succ ?s1 - step ?s2 - step)
  )

  ;; Move a top disk that is the only disk on its source peg to an empty destination peg.
  (:action move-peg-to-empty
    :parameters (?s - step ?snext - step ?src - peg ?dst - peg ?d - disk)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (top ?src ?d)
      (on-peg ?d ?src)
      (top-peg-empty ?dst)
      (clear ?d)
    )
    :effect (and
      ;; remove old location
      (not (on-peg ?d ?src))
      (not (top ?src ?d))
      ;; source becomes empty
      (top-peg-empty ?src)
      ;; place disk on destination peg and mark destination non-empty/top
      (on-peg ?d ?dst)
      (not (top-peg-empty ?dst))
      (top ?dst ?d)
      ;; disk remains clear (nothing on top)
      (clear ?d)
      ;; advance time step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a top disk that is the only disk on its source peg onto the top disk of a non-empty destination peg.
  (:action move-peg-to-disk
    :parameters (?s - step ?snext - step ?src - peg ?dst - peg ?d - disk ?dsttop - disk)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (top ?src ?d)
      (on-peg ?d ?src)
      (top ?dst ?dsttop)
      (clear ?d)
      (smaller ?d ?dsttop)
    )
    :effect (and
      ;; remove old location
      (not (on-peg ?d ?src))
      (not (top ?src ?d))
      ;; source becomes empty
      (top-peg-empty ?src)
      ;; place on top of destination disk
      (on-disk ?d ?dsttop)
      (not (top ?dst ?dsttop))
      (top ?dst ?d)
      ;; destination top no longer clear (now has disk on top)
      (not (clear ?dsttop))
      ;; moved disk remains clear (nothing on top)
      (clear ?d)
      ;; advance time step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a top disk that sits on another disk to an empty destination peg.
  (:action move-disk-to-empty
    :parameters (?s - step ?snext - step ?src - peg ?dst - peg ?d - disk ?below - disk)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (top ?src ?d)
      (on-disk ?d ?below)
      (top-peg-empty ?dst)
      (clear ?d)
    )
    :effect (and
      ;; remove old on-disk relation
      (not (on-disk ?d ?below))
      (not (top ?src ?d))
      ;; the disk below becomes the new top of source peg and becomes clear
      (top ?src ?below)
      (clear ?below)
      ;; place disk on destination peg
      (on-peg ?d ?dst)
      (not (top-peg-empty ?dst))
      (top ?dst ?d)
      ;; moved disk remains clear
      (clear ?d)
      ;; advance time step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )

  ;; Move a top disk that sits on another disk onto the top disk of a non-empty destination peg.
  (:action move-disk-to-disk
    :parameters (?s - step ?snext - step ?src - peg ?dst - peg ?d - disk ?below - disk ?dsttop - disk)
    :precondition (and
      (current-step ?s)
      (succ ?s ?snext)
      (top ?src ?d)
      (on-disk ?d ?below)
      (top ?dst ?dsttop)
      (clear ?d)
      (smaller ?d ?dsttop)
    )
    :effect (and
      ;; remove old on-disk relation and update source top
      (not (on-disk ?d ?below))
      (not (top ?src ?d))
      (top ?src ?below)
      (clear ?below)
      ;; place on destination disk
      (on-disk ?d ?dsttop)
      (not (top ?dst ?dsttop))
      (top ?dst ?d)
      ;; destination top no longer clear
      (not (clear ?dsttop))
      ;; moved disk remains clear
      (clear ?d)
      ;; advance time step
      (not (current-step ?s))
      (current-step ?snext)
    )
  )
)