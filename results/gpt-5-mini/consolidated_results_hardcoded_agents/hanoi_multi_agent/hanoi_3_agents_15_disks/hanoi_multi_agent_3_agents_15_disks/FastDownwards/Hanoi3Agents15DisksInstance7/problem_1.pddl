(define (problem Hanoi3Agents15DisksInstance7)
  (:domain Hanoi3Agents15DisksDomain)
  (:objects
    A B C D E F G H I J K L M N O - disk
    left middle right - peg
  )

  (:init
    ;; peg tops
    (top left A)
    (empty middle)
    (empty right)

    ;; immediate below relations on left (top->...->bottom)
    (below A B)
    (below B C)
    (below C D)
    (below D E)
    (below E F)
    (below F G)
    (below G H)
    (below H I)
    (below I J)
    (below J K)
    (below K L)
    (below L M)
    (below M N)
    (below N O)

    ;; no_below true only for bottom disk initially
    (no_below O)

    ;; agent move permissions
    (allowed_agent1 A) (allowed_agent1 B) (allowed_agent1 C) (allowed_agent1 D) (allowed_agent1 E)
    (allowed_agent2 F) (allowed_agent2 G) (allowed_agent2 H) (allowed_agent2 I) (allowed_agent2 J)
    (allowed_agent3 K) (allowed_agent3 L) (allowed_agent3 M) (allowed_agent3 N) (allowed_agent3 O)

    ;; size ordering: larger X Y means X is larger than Y
    ;; A smallest, O largest. Provide transitive facts pairwise (explicit).
    (larger B A) (larger C A) (larger C B) (larger D A) (larger D B) (larger D C)
    (larger E A) (larger E B) (larger E C) (larger E D)
    (larger F A) (larger F B) (larger F C) (larger F D) (larger F E)
    (larger G A) (larger G B) (larger G C) (larger G D) (larger G E) (larger G F)
    (larger H A) (larger H B) (larger H C) (larger H D) (larger H E) (larger H F) (larger H G)
    (larger I A) (larger I B) (larger I C) (larger I D) (larger I E) (larger I F) (larger I G) (larger I H)
    (larger J A) (larger J B) (larger J C) (larger J D) (larger J E) (larger J F) (larger J G) (larger J H) (larger J I)
    (larger K A) (larger K B) (larger K C) (larger K D) (larger K E) (larger K F) (larger K G) (larger K H) (larger K I) (larger K J)
    (larger L A) (larger L B) (larger L C) (larger L D) (larger L E) (larger L F) (larger L G) (larger L H) (larger L I) (larger L J) (larger L K)
    (larger M A) (larger M B) (larger M C) (larger M D) (larger M E) (larger M F) (larger M G) (larger M H) (larger M I) (larger M J) (larger M K) (larger M L)
    (larger N A) (larger N B) (larger N C) (larger N D) (larger N E) (larger N F) (larger N G) (larger N H) (larger N I) (larger N J) (larger N K) (larger N L) (larger N M)
    (larger O A) (larger O B) (larger O C) (larger O D) (larger O E) (larger O F) (larger O G) (larger O H) (larger O I) (larger O J) (larger O K) (larger O L) (larger O M) (larger O N)
  )

  (:goal (and
    ;; Left peg stack should be (top->bottom) A C D E F G H I J K L M N O
    (top left A)
    (below A C)
    (below C D)
    (below D E)
    (below E F)
    (below F G)
    (below G H)
    (below H I)
    (below I J)
    (below J K)
    (below K L)
    (below L M)
    (below M N)
    (below N O)

    ;; Middle peg should have B (top) and no disk below it (so it's the only disk there)
    (top middle B)
    (no_below B)

    ;; Right peg empty
    (empty right)
  ))
)