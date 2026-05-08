(define (problem hanoi3agents10disksinstance21)
  (:domain multi_agent_hanoi_3agents)
  (:objects
    disk_a disk_b disk_c disk_d disk_e disk_f disk_g disk_h disk_i disk_j - disk
    left middle right - peg
  )

  (:init
    (on disk_a left) (on disk_b left) (on disk_c left) (on disk_d left) (on disk_e left)
    (on disk_f left) (on disk_g left) (on disk_h left) (on disk_i left) (on disk_j left)
    (clear disk_a)
    (empty middle) (empty right)
    (smaller disk_a disk_b) (smaller disk_a disk_c) (smaller disk_a disk_d) (smaller disk_a disk_e) (smaller disk_a disk_f) (smaller disk_a disk_g) (smaller disk_a disk_h) (smaller disk_a disk_i) (smaller disk_a disk_j)
    (smaller disk_b disk_c) (smaller disk_b disk_d) (smaller disk_b disk_e) (smaller disk_b disk_f) (smaller disk_b disk_g) (smaller disk_b disk_h) (smaller disk_b disk_i) (smaller disk_b disk_j)
    (smaller disk_c disk_d) (smaller disk_c disk_e) (smaller disk_c disk_f) (smaller disk_c disk_g) (smaller disk_c disk_h) (smaller disk_c disk_i) (smaller disk_c disk_j)
    (smaller disk_d disk_e) (smaller disk_d disk_f) (smaller disk_d disk_g) (smaller disk_d disk_h) (smaller disk_d disk_i) (smaller disk_d disk_j)
    (smaller disk_e disk_f) (smaller disk_e disk_g) (smaller disk_e disk_h) (smaller disk_e disk_i) (smaller disk_e disk_j)
    (smaller disk_f disk_g) (smaller disk_f disk_h) (smaller disk_f disk_i) (smaller disk_f disk_j)
    (smaller disk_g disk_h) (smaller disk_g disk_i) (smaller disk_g disk_j)
    (smaller disk_h disk_i) (smaller disk_h disk_j)
    (smaller disk_i disk_j)
  )

  (:goal (and
    (on disk_c right)
    (on disk_a left) (on disk_b left) (on disk_d left) (on disk_e left) (on disk_f left)
    (on disk_g left) (on disk_h left) (on disk_i left) (on disk_j left)
    (empty middle)
    (clear disk_a)
  ))
)