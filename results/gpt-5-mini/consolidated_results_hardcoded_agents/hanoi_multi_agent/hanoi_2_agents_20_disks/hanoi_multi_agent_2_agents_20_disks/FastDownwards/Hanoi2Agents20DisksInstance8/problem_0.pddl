(define (problem hanoi_coop_problem)
  (:domain hanoi_coop)

  (:objects
    ;; disks A..T as requested
    A B C D E F G H I J K L M N O P Q R S T - disk
    left middle right - peg
  )

  (:init
    ;; Initial Tower of Hanoi configuration for disks A..D on 'left' (D bottom, A top)
    (on A B)
    (on B C)
    (on C D)
    (on D left)

    ;; All other disks (E..T) are not placed on any peg/disk in this initial state (no on facts).
    ;; Pegs 'middle' and 'right' are empty (clear). 'left' is not clear because D is directly on it.
    (clear A)
    ;; B, C, D are not clear (they have disks on them). We don't assert not-clear facts explicitly;
    ;; absence of clear facts means they are not clear.
    (clear middle)
    (clear right)

    ;; Disk size ordering for the disks that participate (A < B < C < D)
    (smaller A B)
    (smaller A C)
    (smaller A D)
    (smaller B C)
    (smaller B D)
    (smaller C D)

    ;; Allowed-move ownership as provided:
    ;; agent_1 is allowed to move disks A, B, C, D (as given in the primitive move list).
    ;; agent_2 has no allowed moves in the provided data, so we do NOT assert any allowed_agent_2 facts.
    (allowed_agent_1 A)
    (allowed_agent_1 B)
    (allowed_agent_1 C)
    (allowed_agent_1 D)
  )

  (:goal (and
    ;; Goal: move the entire stack A..D from 'left' to 'right' preserving order (D bottom, A top)
    (on A B)
    (on B C)
    (on C D)
    (on D right)
  ))
)