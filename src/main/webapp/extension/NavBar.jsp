<nav class="navbar navbar-expand-lg bg-light shadow-sm">

    <div class="container-fluid">

        <!-- Menu Button -->
        <button class="btn btn-dark"
                type="button"
                data-bs-toggle="offcanvas"
                data-bs-target="#sidebar"
                aria-controls="sidebar">

            <i class="bi bi-list"></i>

        </button>

        <!-- Title -->
        <span class="navbar-brand ms-3 fw-bold">

            Admin Dashboard

        </span>

        <!-- Search -->
        <form class="d-flex ms-auto me-3">

            <input class="form-control"
                   type="search"
                   placeholder="Search">

        </form>

        <!-- Notification -->
        <button class="btn me-2">

            <i class="bi bi-bell fs-5"></i>

        </button>

        <!-- Profile -->
        <div class="dropdown">

            <button class="btn dropdown-toggle"
                    data-bs-toggle="dropdown">

                <i class="bi bi-person-circle"></i>

                Admin

            </button>

            <ul class="dropdown-menu dropdown-menu-end">

                <li>
                    <a class="dropdown-item" href="#">
                        Profile
                    </a>
                </li>

                <li>
                    <a class="dropdown-item" href="#">
                        Settings
                    </a>
                </li>

                <li><hr class="dropdown-divider"></li>

                <li>
                    <a class="dropdown-item text-danger" href="#">
                        Logout
                    </a>
                </li>

            </ul>

        </div>

    </div>

</nav>