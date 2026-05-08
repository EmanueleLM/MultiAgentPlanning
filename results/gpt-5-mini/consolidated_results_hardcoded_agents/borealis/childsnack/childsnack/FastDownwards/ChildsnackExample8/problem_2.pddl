(define (problem prob-snack-10)
  (:domain child-snack)

  (:objects
    ;; children
    child1 child2 child3 child4 child5 child6 child7 child8 child9 child10 - child

    ;; bread portions
    bread1 bread2 bread3 bread4 bread5 bread6 bread7 bread8 bread9 bread10 - bread-portion

    ;; content portions
    content1 content2 content3 content4 content5 content6 content7 content8 content9 content10 - content-portion

    ;; sandwiches (13 potential sandwich objects)
    sandw1 sandw2 sandw3 sandw4 sandw5 sandw6 sandw7 sandw8 sandw9 sandw10 sandw11 sandw12 sandw13 - sandwich

    ;; trays
    tray1 tray2 tray3 - tray

    ;; places (tables; kitchen is a domain constant)
    table1 table2 table3 - place

    ;; slots: 4 slots per tray -> total capacity 12 >= 10 children
    slot1_t1 slot2_t1 slot3_t1 slot4_t1
    slot1_t2 slot2_t2 slot3_t2 slot4_t2
    slot1_t3 slot2_t3 slot3_t3 slot4_t3 - slot

    ;; agents
    chef1 - chef
    server1 - server
  )

  (:init
    ;; chef and server instances
    (is_chef chef1)
    (is_server server1)

    ;; breads and contents are at kitchen and available
    (bread_at bread1 kitchen) (bread_available bread1)
    (bread_at bread2 kitchen) (bread_available bread2)
    (bread_at bread3 kitchen) (bread_available bread3)
    (bread_at bread4 kitchen) (bread_available bread4)
    (bread_at bread5 kitchen) (bread_available bread5)
    (bread_at bread6 kitchen) (bread_available bread6)
    (bread_at bread7 kitchen) (bread_available bread7)
    (bread_at bread8 kitchen) (bread_available bread8)
    (bread_at bread9 kitchen) (bread_available bread9)
    (bread_at bread10 kitchen) (bread_available bread10)

    (content_at content1 kitchen) (content_available content1)
    (content_at content2 kitchen) (content_available content2)
    (content_at content3 kitchen) (content_available content3)
    (content_at content4 kitchen) (content_available content4)
    (content_at content5 kitchen) (content_available content5)
    (content_at content6 kitchen) (content_available content6)
    (content_at content7 kitchen) (content_available content7)
    (content_at content8 kitchen) (content_available content8)
    (content_at content9 kitchen) (content_available content9)
    (content_at content10 kitchen) (content_available content10)

    ;; gluten-free assignments per problem statement
    (bread_gf bread6)
    (bread_gf bread2)
    (bread_gf bread8)
    (bread_gf bread7)

    (content_gf content5)
    (content_gf content6)
    (content_gf content2)
    (content_gf content8)

    ;; trays at kitchen and initially pure
    (tray_at tray1 kitchen)
    (tray_at tray2 kitchen)
    (tray_at tray3 kitchen)
    (tray_pure tray1)
    (tray_pure tray2)
    (tray_pure tray3)

    ;; slots ownership and initially free
    (slot_of slot1_t1 tray1) (slot_of slot2_t1 tray1) (slot_of slot3_t1 tray1) (slot_of slot4_t1 tray1)
    (slot_of slot1_t2 tray2) (slot_of slot2_t2 tray2) (slot_of slot3_t2 tray2) (slot_of slot4_t2 tray2)
    (slot_of slot1_t3 tray3) (slot_of slot2_t3 tray3) (slot_of slot3_t3 tray3) (slot_of slot4_t3 tray3)

    (free_slot slot1_t1) (free_slot slot2_t1) (free_slot slot3_t1) (free_slot slot4_t1)
    (free_slot slot1_t2) (free_slot slot2_t2) (free_slot slot3_t2) (free_slot slot4_t2)
    (free_slot slot1_t3) (free_slot slot2_t3) (free_slot slot3_t3) (free_slot slot4_t3)

    ;; children waiting locations (as specified)
    (waiting_at child1 table1)
    (waiting_at child2 table1)
    (waiting_at child3 table1)
    (waiting_at child7 table1)
    (waiting_at child10 table1)

    (waiting_at child5 table2)
    (waiting_at child6 table2)
    (waiting_at child8 table2)
    (waiting_at child9 table2)

    (waiting_at child4 table3)

    ;; children allergic to gluten per problem statement
    (child_allergic_gluten child9)
    (child_allergic_gluten child2)
    (child_allergic_gluten child3)
    (child_allergic_gluten child7)

    ;; initially no sandwiches are ready (sandwich objects exist but no sandwich_ready facts)
  )

  (:goal (and
    (served child1)
    (served child2)
    (served child3)
    (served child4)
    (served child5)
    (served child6)
    (served child7)
    (served child8)
    (served child9)
    (served child10)
  ))
)