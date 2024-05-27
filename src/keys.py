import os

def ssh_key(ssh_dir, project, env, index):
    """
    >>> ssh_key('.ssh', 'project', 'env', '10')
    '.ssh/project-env-10'
    """
    return os.path.join(ssh_dir, f"{project}-{env}-{index}")
